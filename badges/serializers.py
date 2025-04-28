from rest_framework import serializers
from .models import Badge, UserBadge
from users.serializers import UserSerializer


class BadgeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Badge
        fields = ['id', 'name', 'description', 'icon']


class UserBadgeSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    badge = BadgeSerializer(read_only=True)

    class Meta:
        model = UserBadge
        fields = ['id', 'user', 'badge', 'assignment_date']