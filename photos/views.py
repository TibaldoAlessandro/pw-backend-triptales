from rest_framework import generics, permissions
from .models import Photo
from .serializers import PhotoSerializer

class PhotoCreateView(generics.CreateAPIView):
    queryset = Photo.objects.all()
    serializer_class = PhotoSerializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save()  # Salva l'immagine senza analisi ML