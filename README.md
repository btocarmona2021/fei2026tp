# Trabajo Práctico Nro. 1 - Frameworks e Interoperabilidad 2026

Este es un trabajo práctico de la facultad donde creamos desde cero un backend
usando Django (Python) conectado a una base de datos PostgreSQL, todo dentro de
contenedores Docker.

## Tecnologías utilizadas

- Python 3.12 con Django 6.0.5
- PostgreSQL 16
- Docker y Docker Compose
- Django Rest Framework (DRF)

## Estructura del proyecto

```
fei2026tp/
├── backend/
│   ├── aulas/
│   │   ├── models.py
│   │   ├── serializers.py
│   │   ├── views.py
│   │   ├── urls.py
│   │   ├── admin.py
│   │   └── migrations/
│   ├── practico01/
│   │   ├── settings.py
│   │   ├── urls.py
│   │   ├── wsgi.py
│   │   └── asgi.py
│   └── manage.py
├── bin/
│   ├── shell.sh
│   └── python.sh
├── config/
│   └── django-image/
│       ├── Dockerfile
│       ├── requirements.txt
│       └── start.sh
├── docker-compose.yml
├── .env
├── .env-dist
└── .gitignore
```

## Cómo levantar el proyecto

```bash
docker compose up -d
```

Esto levanta dos contenedores:
- **postgres**: base de datos PostgreSQL en el puerto 5432
- **django_app**: servidor de Django en el puerto 8000

## Scripts de soporte

### shell.sh
Abre el shell interactivo de Django dentro del contenedor:
```bash
./bin/shell.sh
```

### python.sh
Ejecuta comandos de Python pasando los argumentos al contenedor:
```bash
./bin/python.sh manage.py migrate
./bin/python.sh manage.py startapp nombredelaapp
```

## APIs disponibles

### Carrera

| Método | URL | Descripción |
|---|---|---|
| GET | /api/carrera/ | Lista todas las carreras |
| POST | /api/carrera/ | Crea una nueva carrera |

### Profesor

| Método | URL | Descripción |
|---|---|---|
| GET | /api/profesor/ | Lista todos los profesores |
| POST | /api/profesor/ | Crea un nuevo profesor |
| GET | /api/profesor/1/ | Muestra el profesor con ID 1 |
| PUT | /api/profesor/1/ | Actualiza el profesor con ID 1 |
| PATCH | /api/profesor/1/ | Actualiza parcialmente el profesor con ID 1 |
| DELETE | /api/profesor/1/ | Elimina el profesor con ID 1 |

## Cómo probar las APIs

```bash
# Listar carreras
http localhost:8000/api/carrera/

# Crear una carrera
http POST localhost:8000/api/carrera/ nombre="Ingeniería"

# Listar profesores
http localhost:8000/api/profesor/

# Crear un profesor
http POST localhost:8000/api/profesor/ nombre="Juan" apellido="Perez" mostrar="TP"

# Ver detalle de un profesor
http localhost:8000/api/profesor/1/

# Actualizar un profesor
http PUT localhost:8000/api/profesor/1/ nombre="Carlos" apellido="Gomez" mostrar="TP"

# Eliminar un profesor
http DELETE localhost:8000/api/profesor/1/
```

## Comandos útiles

```bash
# Reiniciar los contenedores
docker compose down && docker compose up -d

```
