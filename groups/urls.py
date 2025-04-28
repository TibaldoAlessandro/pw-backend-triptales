from django.urls import path
from .views import (
    GroupListCreateView, GroupDetailView,
    GroupMembershipCreateView, UserGroupsListView
)

urlpatterns = [
    path('', GroupListCreateView.as_view(), name='group-list'),
    path('<int:pk>/', GroupDetailView.as_view(), name='group-detail'),
    path('<int:group_id>/join/', GroupMembershipCreateView.as_view(), name='group-join'),
    path('my-groups/', UserGroupsListView.as_view(), name='user-groups'),
]