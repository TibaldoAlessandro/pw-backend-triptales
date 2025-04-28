from rest_framework import serializers
from .models import Group, GroupMembership
from users.serializers import UserSerializer


class GroupSerializer(serializers.ModelSerializer):
    creator = UserSerializer(read_only=True)

    class Meta:
        model = Group
        fields = ['id', 'name', 'description', 'creation_date', 'creator']


class GroupMembershipSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    group = GroupSerializer(read_only=True)

    class Meta:
        model = GroupMembership
        fields = ['id', 'user', 'group', 'join_date']