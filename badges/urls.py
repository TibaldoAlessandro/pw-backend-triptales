from django.urls import path
from .views import BadgeListView, UserBadgeListView, AssignBadgeView

urlpatterns = [
    path('', BadgeListView.as_view(), name='badge-list'),
    path('my-badges/', UserBadgeListView.as_view(), name='user-badges'),
    path('users/<int:user_id>/badges/<int:badge_id>/assign/', AssignBadgeView.as_view(), name='assign-badge'),
]