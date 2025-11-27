FROM python:3.11-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir \
    fastapi==0.100.0 \
    Jinja2==3.1.2 \
    PyJWT==2.7.0 \
    python-multipart==0.0.6 \
    requests==2.31.0 \
    tinydb==4.8.0 \
    "uvicorn[standard]==0.22.0"

COPY app/ ./app/
COPY config.json .
COPY templates/ ./templates/
COPY static/ ./static/

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]

EXPOSE 8181