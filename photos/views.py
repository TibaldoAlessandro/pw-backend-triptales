from rest_framework import generics, permissions
from rest_framework.response import Response
from rest_framework import status
from .models import Photo
from .serializers import PhotoSerializer
from posts.models import Post


class PhotoCreateView(generics.CreateAPIView):
    queryset = Photo.objects.all()
    serializer_class = PhotoSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_serializer_context(self):
        """Aggiunge il contesto della richiesta al serializer"""
        context = super().get_serializer_context()
        context['request'] = self.request
        return context

    def create(self, request, *args, **kwargs):
        # Debug: stampa tutti i dati ricevuti
        print(f"Request FILES: {request.FILES}")
        print(f"Request POST data: {request.POST}")

        # Verifica che tutti i campi necessari siano presenti
        if 'image' not in request.FILES:
            return Response({'error': 'Image file is required'},
                            status=status.HTTP_400_BAD_REQUEST)

        if 'post' not in request.POST:
            return Response({'error': 'Post ID is required'},
                            status=status.HTTP_400_BAD_REQUEST)

        try:
            post_id = int(request.POST['post'])
            post = Post.objects.get(id=post_id)
        except (ValueError, Post.DoesNotExist):
            return Response({'error': 'Invalid post ID'},
                            status=status.HTTP_400_BAD_REQUEST)

        # Prepara i dati per il serializer
        data = {
            'post_id': post_id,
            'image': request.FILES['image'],
            'latitude': request.POST.get('latitude'),
            'longitude': request.POST.get('longitude'),
        }

        serializer = self.get_serializer(data=data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            print(f"Serializer errors: {serializer.errors}")
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)