from django.urls import path
from .views import CommentListCreateView, CommentDetailView, PostCommentsListView

urlpatterns = [
    path('', CommentListCreateView.as_view(), name='comment-list'),
    path('<int:pk>/', CommentDetailView.as_view(), name='comment-detail'),
    path('post/<int:post_id>/', PostCommentsListView.as_view(), name='post-comments'),
]