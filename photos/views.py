from rest_framework import generics, permissions
from .models import Photo
from .serializers import PhotoSerializer


class PhotoCreateView(generics.CreateAPIView):
    queryset = Photo.objects.all()
    serializer_class = PhotoSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_serializer_context(self):
        """Aggiunge il contesto della richiesta al serializer"""
        context = super().get_serializer_context()
        context['request'] = self.request
        return context