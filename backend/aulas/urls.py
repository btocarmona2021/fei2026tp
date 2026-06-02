from django.urls import path
from .views import CarreraMixin, ProfesorMixinDetail, ProfesorMixin

urlpatterns = [
    path("carrera/", CarreraMixin.as_view(), name="carrera-list-create"),
    path("profesor/<int:pk>/", ProfesorMixinDetail.as_view(), name="profesor-detail"),
    path("profesor/", ProfesorMixin.as_view(), name="profesor-list-create"),
]
