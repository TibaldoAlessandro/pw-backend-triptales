from rest_framework import serializers
from .models import Post
from users.serializers import UserSerializer
from groups.serializers import GroupSerializer


class PostSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    group = GroupSerializer(read_only=True)

    class Meta:
        model = Post
        fields = ['id', 'author', 'group', 'text', 'created_at']