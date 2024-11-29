# Use a specific Python version
FROM python:3.10-alpine AS builder

WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.10-alpine

WORKDIR /app

# Copy installed dependencies from builder
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 5001

# Run the application
CMD ["python", "app.py"]
