# Use a specific Python version
FROM python:3.10-alpine as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.10-alpine
WORKDIR /app
COPY --from=builder /app /app
COPY . .

EXPOSE 7000
CMD ["python", "app.py"]
