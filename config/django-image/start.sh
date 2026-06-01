#!/bin/bash

# Testeo hasta que este levantada la base de datos
echo "Esperando a la base de datos..."
while ! nc -z postgres 5432; do
    sleep 0.1
done
echo "Base de datos disponible."

# Si no existe manage.py, se asume que no hay un proyecto Django y se crea uno nuevo
if [ ! -f "manage.py" ]; then
    echo "No se encontró un proyecto Django. Creando proyecto inicial..."
    django-admin startproject practico01 .
    chown -R $(stat -c '%u:%g' /app) /app 2>/dev/null || true
fi

# generor y aplicar migraciones
echo "Generando y aplicando migraciones..."
python manage.py makemigrations
python manage.py migrate

# Si no existe un superusuario, se crea uno nuevo utilizando las variables de entorno
echo "Creando superusuario (si no existe)..."
if [ "$DJANGO_SUPERUSER_USERNAME" ]; then
    python manage.py createsuperuser --no-input || echo "El superusuario ya existe o no se pudo crear."
fi

# 4. Iniciar el servidor de desarrollo de Django
echo "Arrancando el servidor de desarrollo en el puerto 8000..."
chown -R $(stat -c '%u:%g' /app) /app 2>/dev/null || true
exec python manage.py runserver 0.0.0.0:8000