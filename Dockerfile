FROM python:3.11-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir fastapi==0.100.0
RUN pip install --no-cache-dir Jinja2==3.1.2
RUN pip install --no-cache-dir PyJWT==2.7.0
RUN pip install --no-cache-dir python-multipart==0.0.6
RUN pip install --no-cache-dir requests==2.31.0
RUN pip install --no-cache-dir tinydb==4.8.0
RUN pip install --no-cache-dir uvicorn[standard]==0.22.0

COPY app/ ./app/
COPY config.json .
COPY templates/ ./templates/

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8181"]

EXPOSE 8181