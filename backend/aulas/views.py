from rest_framework import mixins
from rest_framework import generics
from .models import Carrera
from .serializers import CarreraSerializer


class CarreraMixin( mixins.ListModelMixin, mixins.CreateModelMixin, generics.GenericAPIView ):
    
    queryset = Carrera.objects.all()
    serializer_class = CarreraSerializer

    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)
