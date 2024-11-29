FROM python:3.x-slim as builder
WORKDIR /app
COPY requirements.txt .
RUN pip instal --no-cache-dir -r requirements.txt

FROM python:3.x-slim
WORKDIR /app
COPY --from=builder /app /app
COPY . .
CMD ["python", "app.py"]
