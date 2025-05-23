from .views import PostListCreateView, PostDetailView, GroupPostsListView
from django.urls import path
from .views import (
    PostListCreateView,
    PostDetailView,
    GroupPostsListView,
    AllPostsListView,  # NUOVO
    toggle_like
)

urlpatterns = [
    path('', PostListCreateView.as_view(), name='post-list'),
    path('all/', AllPostsListView.as_view(), name='all-posts'),  # NUOVO ENDPOINT
    path('<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('group/<int:group_id>/', GroupPostsListView.as_view(), name='group-posts'),
    path('<int:post_id>/toggle-like/', toggle_like, name='toggle-like'),
]