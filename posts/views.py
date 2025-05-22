from rest_framework import generics, permissions
from .serializers import PostSerializer
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .models import Like, Post
from groups.models import Group


class PostListCreateView(generics.ListCreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        print(f"Request data: {self.request.data}")
        group_id = self.request.data.get('group_id')
        print(f"Group ID extracted: {group_id}")

        if not group_id:
            return Response({'error': 'group_id is required'},
                            status=status.HTTP_400_BAD_REQUEST)

        try:
            group = Group.objects.get(id=group_id)
            serializer.save(author=self.request.user, group=group)
        except Group.DoesNotExist:
            return Response({'error': 'Group not found'},
                            status=status.HTTP_404_NOT_FOUND)


class PostDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupPostsListView(generics.ListAPIView):
    serializer_class = PostSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        group_id = self.kwargs.get('group_id')
        return Post.objects.filter(group_id=group_id).order_by('-created_at')


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def toggle_like(request, post_id):
    try:
        post = Post.objects.get(id=post_id)
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