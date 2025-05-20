from django.urls import path
from .views import (
    GroupListCreateView, GroupDetailView,
    GroupMembershipCreateView, UserGroupsListView,
    GroupInvitationCreateView, GroupInvitationRespondView,
    UserInvitationsListView, GroupMembersListView
)

urlpatterns = [
    path('', GroupListCreateView.as_view(), name='group-list'),
    path('<int:pk>/', GroupDetailView.as_view(), name='group-detail'),
    path('<int:group_id>/join/', GroupMembershipCreateView.as_view(), name='group-join'),
    path('<int:group_id>/invite/', GroupInvitationCreateView.as_view(), name='group-invite'),
    path('invitations/', UserInvitationsListView.as_view(), name='user-invitations'),
    path('invitations/<int:pk>/respond/', GroupInvitationRespondView.as_view(), name='respond-invitation'),
    path('my-groups/', UserGroupsListView.as_view(), name='user-groups'),
    path('<int:group_id>/members/', GroupMembersListView.as_view(), name='group-members'),
]