# 🐳 Docker Deployment

This fork provides production-ready Docker containers for deploying RobotFramework Dashboard.

## Quick Start

### Using Docker Compose (Recommended)

```bash
# Clone the repository
git clone https://github.com/mappadurai/robotframework-dashboard-standalone.git
cd robotframework-dashboard-standalone

# Start the dashboard
docker-compose up -d
```

The dashboard will be available at `http://localhost:8000`

### Using Docker Directly

```bash
# Pull the pre-built image
docker pull sankaram04/robotframework-dashboard:latest

# Run the container
docker run -d \
  --name robotframework-dashboard \
  -p 8000:8000 \
  -v $(pwd)/data:/app/data \
  -v $(pwd)/logs:/app/robot_logs \
  sankaram04/robotframework-dashboard:latest
```

## Building Your Own Image

### Development Build

```bash
# Build development image
docker build -t robotframework-dashboard:dev -f Dockerfile .

# Run development container
docker run -d -p 8000:8000 robotframework-dashboard:dev
```

### Production Build

The production Dockerfile uses multi-stage builds for optimized image size:

```bash
# Build production image
docker build -t robotframework-dashboard:prod -f Dockerfile.prod .

# Run production container
docker run -d \
  --name dashboard \
  -p 8000:8000 \
  --restart unless-stopped \
  sankaram04/robotframework-dashboard:prod
```

## Configuration

### Environment Variables

Configure the dashboard using environment variables:

```bash
docker run -d \
  -e ROBOTDASHBOARD_HOST=0.0.0.0 \
  -e ROBOTDASHBOARD_PORT=8000 \
  -e DATABASE_PATH=/app/data/robot_results.db \
  -e LOG_DIR=/app/robot_logs \
  -p 8000:8000 \
  sankaram04/robotframework-dashboard:latest
```

### Persistent Storage

Mount volumes to persist data and logs:

```bash
docker run -d \
  -v /path/to/data:/app/data \
  -v /path/to/logs:/app/robot_logs \
  -p 8000:8000 \
  sankaram04/robotframework-dashboard:latest
```

## Docker Compose Configuration

Create a `docker-compose.yml` file:

```yaml
version: '3.8'

services:
  dashboard:
    image: sankaram04/robotframework-dashboard:latest
    container_name: robotframework-dashboard
    ports:
      - "8000:8000"
    volumes:
      - ./data:/app/data
      - ./logs:/app/robot_logs
    environment:
      - ROBOTDASHBOARD_HOST=0.0.0.0
      - ROBOTDASHBOARD_PORT=8000
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "python", "-c", "import requests; requests.get('http://localhost:8000').raise_for_status()"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 60s
```

## Container Registry

Pre-built images are available on Docker Hub:

- **Latest stable:** `sankaram04/robotframework-dashboard:latest`
- **Specific version:** `sankaram04/robotframework-dashboard:v1.4.0`

## Uploading Results to Docker Container

### From Host Machine

```bash
# Upload output.xml to running container
curl -X POST http://localhost:8000/upload-output \
  -F "file=@output.xml" \
  -F "output_tags=prod" \
  -F "output_tags=regression" \
  -F "output_alias=Nightly-Run-$(date +%Y%m%d)"
```

### From CI/CD Pipeline

```bash
# In your CI/CD script
python3 upload_to_dashboard.py \
  --output-file output.xml \
  --tags "ci,${CI_BRANCH},${CI_BUILD_NUMBER}" \
  --alias "${CI_PROJECT_NAME}-${CI_BUILD_NUMBER}" \
  --dashboard-url http://dashboard-host:8000
```

## Troubleshooting

### Container won't start

Check container logs:
```bash
docker logs robotframework-dashboard
```

### Permission issues

Ensure volumes have correct permissions:
```bash
sudo chown -R 1000:1000 ./data ./logs
```

### Port already in use

Change the host port mapping:
```bash
docker run -d -p 8080:8000 sankaram04/robotframework-dashboard:latest
```

## Next Steps

- [Kubernetes Deployment](/kubernetes-deployment.md) - Deploy to Kubernetes cluster
- [Helm Charts](/helm-deployment.md) - Use Helm for Kubernetes deployment
