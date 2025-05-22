from rest_framework import serializers
from .models import Post, Like
from photos.models import Photo
from comments.models import Comment
from users.serializers import UserSerializer
from groups.serializers import GroupSerializer
from groups.models import Group


class PhotoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Photo
        fields = ['id', 'image', 'latitude', 'longitude', 'created_at']


class LikeSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)

    class Meta:
        model = Like
        fields = ['id', 'author', 'created_at']


class CommentSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'author', 'text', 'created_at']


class PostSerializer(serializers.ModelSerializer):
    author = UserSerializer(read_only=True)
    group = GroupSerializer(read_only=True)
    photos = PhotoSerializer(many=True, read_only=True)
    likes = LikeSerializer(many=True, read_only=True)
    comments = CommentSerializer(many=True, read_only=True)
    likes_count = serializers.SerializerMethodField()
    user_has_liked = serializers.SerializerMethodField()

    # Campo per ricevere group_id in input
    group_id = serializers.PrimaryKeyRelatedField(
        queryset=Group.objects.all(),
        write_only=True,
        source='group',
        required=False  # Sarà gestito nella view
    )

    class Meta:
        model = Post
        fields = [
            'id', 'author', 'group', 'group_id', 'text', 'created_at',
            'photos', 'likes', 'comments', 'likes_count', 'user_has_liked'
        ]

    def get_likes_count(self, obj):
        return obj.likes.count()

    def get_user_has_liked(self, obj):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            return obj.likes.filter(author=request.user).exists()
        return False