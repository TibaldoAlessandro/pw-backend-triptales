from rest_framework import generics, permissions
from .models import Badge, UserBadge
from .serializers import BadgeSerializer, UserBadgeSerializer
from users.models import User


class BadgeListView(generics.ListAPIView):
    queryset = Badge.objects.all()
    serializer_class = BadgeSerializer
    permission_classes = [permissions.IsAuthenticated]


class UserBadgeListView(generics.ListAPIView):
    serializer_class = UserBadgeSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        return UserBadge.objects.filter(user=self.request.user)


class AssignBadgeView(generics.CreateAPIView):
    queryset = UserBadge.objects.all()
    serializer_class = UserBadgeSerializer
    permission_classes = [permissions.IsAdminUser]

    def perform_create(self, serializer):
        user_id = self.kwargs.get('user_id')
        badge_id = self.kwargs.get('badge_id')
        user = User.objects.get(id=user_id)
        badge = Badge.objects.get(id=badge_id)
        serializer.save(user=user, badge=badge)