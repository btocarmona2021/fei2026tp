from django.urls import path
from .views import CarreraMixin

urlpatterns = [
    path("carrera/", CarreraMixin.as_view(), name="carrera-list-create"),
]
