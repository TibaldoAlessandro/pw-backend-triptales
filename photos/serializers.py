from rest_framework import serializers
from .models import Photo
from posts.models import Post


class PhotoSerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField()
    post_id = serializers.PrimaryKeyRelatedField(
        queryset=Post.objects.all(),
        write_only=True,
        source='post'
    )

    class Meta:
        model = Photo
        fields = ['id', 'image', 'post_id', 'latitude', 'longitude', 'created_at']

    def get_image(self, obj):
        """Restituisce l'URL completo dell'immagine"""
        if obj.image:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri(obj.image.url)
            return obj.image.url
        return None