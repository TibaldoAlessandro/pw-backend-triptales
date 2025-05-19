from rest_framework import generics, permissions, status
from rest_framework.response import Response
from users import serializers
from .models import Group, GroupMembership, GroupInvitation  # Import GroupMembership here
from .serializers import GroupSerializer, GroupMembershipSerializer, GroupInvitationSerializer
from django.contrib.auth import get_user_model
User = get_user_model()


# Add missing views referenced in urls.py
class GroupListCreateView(generics.ListCreateAPIView):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        # Set the creator to the current user
        group = serializer.save(creator=self.request.user)
        # Also make the creator a member and admin of the group
        GroupMembership.objects.create(
            user=self.request.user,
            group=group,
            role='ADMIN'
        )


class GroupDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupMembershipCreateView(generics.CreateAPIView):
    serializer_class = GroupMembershipSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        group_id = self.kwargs.get('group_id')
        group = Group.objects.get(pk=group_id)
        serializer.save(
            user=self.request.user,
            group=group
        )


class UserGroupsListView(generics.ListAPIView):
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        # Get all groups where the user is a member
        memberships = GroupMembership.objects.filter(user=self.request.user)
        return Group.objects.filter(id__in=memberships.values('group_id'))


class GroupInvitationCreateView(generics.CreateAPIView):
    queryset = GroupInvitation.objects.all()
    serializer_class = GroupInvitationSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        group_id = self.kwargs.get('group_id')
        email = self.request.data.get('recipient')

        try:
            recipient_user = User.objects.get(email=email)
        except User.DoesNotExist:
            raise serializers.ValidationError({"recipient": "Utente con questa email non trovato"})

        serializer.save(
            group_id=group_id,
            sender=self.request.user,
            recipient=recipient_user,
            status='PENDING'
        )


class GroupInvitationRespondView(generics.UpdateAPIView):
    queryset = GroupInvitation.objects.all()
    serializer_class = GroupInvitationSerializer
    permission_classes = [permissions.IsAuthenticated]

    def update(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.recipient != request.user:
            return Response(
                {"detail": "Non sei il destinatario di questo invito"},
                status=status.HTTP_403_FORBIDDEN
            )

        response_status = request.data.get('status')
        if response_status not in ['ACCEPTED', 'REJECTED']:
            return Response(
                {"detail": "Stato non valido"},
                status=status.HTTP_400_BAD_REQUEST
            )

        instance.status = response_status
        instance.save()

        if response_status == 'ACCEPTED':
            GroupMembership.objects.get_or_create(
                user=instance.recipient,
                group=instance.group,
                defaults={'role': 'MEMBER'}
            )

        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class UserInvitationsListView(generics.ListAPIView):
    serializer_class = GroupInvitationSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return GroupInvitation.objects.filter(
            recipient=self.request.user,
            status='PENDING'
        )