from rest_framework import serializers
from .models import Photo
from posts.models import Post

class PhotoSerializer(serializers.ModelSerializer):
    post_id = serializers.PrimaryKeyRelatedField(
        queryset=Post.objects.all(),
        write_only=True,
        source='post'
    )
    image = serializers.SerializerMethodField()

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

    def create(self, validated_data):
        """Override del metodo create per gestire l'upload dell'immagine"""
        # Rimuovi image dal metodo create dato che è read-only
        return super().create(validated_data)