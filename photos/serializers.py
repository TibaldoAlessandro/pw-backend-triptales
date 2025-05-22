from rest_framework import serializers
from .models import Photo
from posts.models import Post

class PhotoSerializer(serializers.ModelSerializer):
    image = serializers.ImageField()
    post_id = serializers.PrimaryKeyRelatedField(
        queryset=Post.objects.all(),
        write_only=True,
        source='post'
    )
    image_url = serializers.SerializerMethodField()

    class Meta:
        model = Photo
        fields = ['id', 'image', 'image_url', 'post_id', 'latitude', 'longitude', 'created_at']
        extra_kwargs = {
            'image': {'write_only': True}
        }

    def get_image_url(self, obj):
        """Restituisce l'URL completo dell'immagine"""
        if obj.image:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri(obj.image.url)
            return obj.image.url
        return None

    def to_representation(self, instance):
        """Personalizza la rappresentazione dell'output"""
        data = super().to_representation(instance)
        # Sostituisci il campo 'image' con 'image_url' nell'output
        data['image'] = data.pop('image_url')
        return data