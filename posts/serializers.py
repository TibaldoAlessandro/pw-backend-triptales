from rest_framework import serializers

from groups.models import Group
from .models import Post
from users.serializers import UserSerializer
from groups.serializers import GroupSerializer


class PostSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    group = GroupSerializer(read_only=True)  # Per l'output
    group_id = serializers.PrimaryKeyRelatedField(
        queryset=Group.objects.all(), write_only=True, source='group'
    )  # Per l'input

    class Meta:
        model = Post
        fields = ['id', 'author', 'group', 'group_id', 'text', 'created_at']