from rest_framework.authtoken import views
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api-token-auth/', views.obtain_auth_token),
    path('api/auth/', include('users.urls')),
    path('api/groups/', include('groups.urls')),
    path('api/posts/', include('posts.urls')),
    path('api/badges/', include('badges.urls')),
    path('api/comments/', include('comments.urls')),
    path('api/photos/', include('photos.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)