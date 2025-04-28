from django.urls import path
from .views import PhotoCreateView

urlpatterns = [
    path('upload/', PhotoCreateView.as_view(), name='photo-upload'),
]