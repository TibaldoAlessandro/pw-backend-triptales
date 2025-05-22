from rest_framework import generics, permissions
from .serializers import PostSerializer
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .models import Like, Post
from groups.models import Group
from rest_framework import serializers


class PostListCreateView(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        # Ottieni il group_id dal payload
        group_id = self.request.data.get('group_id')

        if not group_id:
            raise serializers.ValidationError({'group_id': 'This field is required.'})

        try:
            group = Group.objects.get(id=group_id)

            # Verifica che l'utente sia membro del gruppo
            if not group.members.filter(id=self.request.user.id).exists():
                raise serializers.ValidationError({'group': 'You are not a member of this group.'})

            serializer.save(author=self.request.user, group=group)

        except Group.DoesNotExist:
            raise serializers.ValidationError({'group_id': 'Group not found.'})


class PostDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        user_groups = self.request.user.group_memberships.all()
        return Post.objects.filter(group__in=user_groups)


class GroupPostsListView(generics.ListAPIView):
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        group_id = self.kwargs.get('group_id')

        # Verifica che l'utente sia membro del gruppo
        try:
            group = Group.objects.get(id=group_id)
            if not group.members.filter(id=self.request.user.id).exists():
                return Post.objects.none()
        except Group.DoesNotExist:
            return Post.objects.none()

        return Post.objects.filter(group_id=group_id).order_by('-created_at')


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def toggle_like(request, post_id):
    try:
        post = Post.objects.get(id=post_id)

        # Verifica che l'utente sia membro del gruppo del post
        if not post.group.members.filter(id=request.user.id).exists():
            return Response({'error': 'You are not a member of this group'},
                            status=status.HTTP_403_FORBIDDEN)

        like, created = Like.objects.get_or_create(
            author=request.user,
            post=post
        )

        if not created:
            # Se il like esisteva già, lo rimuoviamo
            like.delete()
            return Response({'liked': False, 'likes_count': post.likes.count()})
        else:
            # Nuovo like
            return Response({'liked': True, 'likes_count': post.likes.count()})

    except Post.DoesNotExist:
        return Response({'error': 'Post not found'},
                        status=status.HTTP_404_NOT_FOUND)