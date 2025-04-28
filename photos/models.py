from django.db import models
from posts.models import Post
from django.utils import timezone

class Photo(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='photos')
    image = models.ImageField(upload_to='trip_photos/')  # Salva in MEDIA_ROOT/trip_photos/
    latitude = models.FloatField(blank=True, null=True)  # Opzionale per geolocalizzazione
    longitude = models.FloatField(blank=True, null=True)  # Opzionale per geolocalizzazione
    created_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f"Photo {self.id} for Post {self.post.id}"