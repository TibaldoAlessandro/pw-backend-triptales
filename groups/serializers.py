from rest_framework import serializers
from .models import Group, GroupMembership, GroupInvitation
from users.serializers import UserSerializer


class GroupSerializer(serializers.ModelSerializer):
    creator = UserSerializer(read_only=True)

    class Meta:
        model = Group
        fields = ['id', 'name', 'description', 'creation_date', 'creator']


class GroupInvitationSerializer(serializers.ModelSerializer):
    group = GroupSerializer(read_only=True)
    sender = UserSerializer(read_only=True)
    recipient = UserSerializer(read_only=True)

    class Meta:
        model = GroupInvitation
        fields = ['id', 'group', 'sender', 'recipient', 'status', 'created_at', 'updated_at']
        read_only_fields = ['sender', 'created_at', 'updated_at']

class GroupMembershipSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)
    group = GroupSerializer(read_only=True)

    class Meta:
        model = GroupMembership
        fields = ['id', 'user', 'group', 'join_date', 'role']