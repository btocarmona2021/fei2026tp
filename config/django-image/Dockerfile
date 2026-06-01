
FROM python:3.12.2-bookworm

RUN apt-get update && apt-get install -y \
    python3-dev \
    libpq-dev \
    gcc \
    netcat-openbsd

WORKDIR /app

RUN pip install --upgrade pip setuptools

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY start.sh /start.sh

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]





