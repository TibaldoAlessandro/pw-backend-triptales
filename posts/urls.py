from django.urls import path
from .views import PostListCreateView, PostDetailView, GroupPostsListView

urlpatterns = [
    path('', PostListCreateView.as_view(), name='post-list'),
    path('<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('group/<int:group_id>/', GroupPostsListView.as_view(), name='group-posts'),
]