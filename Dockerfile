FROM python:3.11-slim

WORKDIR /app

ENV FLASK_RUN_HOST=$COOLIFY_FQDN
ENV FLASK_RUN_PORT=$PORT
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "run.py"]
