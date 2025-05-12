from rest_framework import serializers

from posts.models import Post
from .models import Comment
from users.serializers import UserSerializer
from posts.serializers import PostSerializer

class CommentSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    post = PostSerializer(read_only=True)  # Per mostrare i dati del post
    post_id = serializers.PrimaryKeyRelatedField(
        queryset=Post.objects.all(), write_only=True, source='post'
    )  # Per ricevere l'ID del post nel POST

    class Meta:
        model = Comment
        fields = ['id', 'author', 'post', 'post_id', 'text', 'created_at']
