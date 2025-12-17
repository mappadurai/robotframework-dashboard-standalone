# Use Python 3.12 slim image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy the application code
COPY . .

# Install the package with server dependencies
RUN pip install --no-cache-dir -e .[server]

# Install python-multipart for file uploads
RUN pip install --no-cache-dir python-multipart

# Create directory for logs and database
RUN mkdir -p /app/robot_logs /app/data

# Expose the port
EXPOSE 8000

# Set environment variables
ENV PYTHONPATH=/app
ENV ROBOTDASHBOARD_HOST=0.0.0.0
ENV ROBOTDASHBOARD_PORT=8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8000/ || exit 1

# Command to run the application
CMD ["robotdashboard", "--server", "0.0.0.0:8000"]
