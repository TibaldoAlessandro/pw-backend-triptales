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
        request = self.context.get('request')
        if obj.image and request:
            return request.build_absolute_uri(obj.image.url)
        return None

    def validate(self, data):
        """
        Validazioni personalizzate per le coordinate
        """
        latitude = data.get('latitude')
        longitude = data.get('longitude')

        # Se una coordinata è specificata, l'altra deve essere specificata anche
        if (latitude is not None and longitude is None) or (latitude is None and longitude is not None):
            raise serializers.ValidationError(
                "Se specifichi latitude, devi specificare anche longitude e viceversa"
            )

        # Validazioni sui range delle coordinate
        if latitude is not None:
            if not (-90 <= latitude <= 90):
                raise serializers.ValidationError("Latitude deve essere tra -90 e 90")

        if longitude is not None:
            if not (-180 <= longitude <= 180):
                raise serializers.ValidationError("Longitude deve essere tra -180 e 180")

        return data

    def create(self, validated_data):
        """Override del metodo create per gestire l'upload dell'immagine"""
        # Rimuovi image dal metodo create dato che è read-only
        return super().create(validated_data)