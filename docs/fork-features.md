# 🚀 Fork Features

This fork adds production-ready deployment capabilities to the original Robot Framework Dashboard.

For complete documentation, see [README-FORK.md](https://github.com/mappadurai/robotframework-dashboard-standalone/blob/main/README-FORK.md) in the repository root.

## Added Features

### 🐳 Docker & Containerization
- **Dockerfile** - Production-ready container image
- **Dockerfile.prod** - Multi-stage production build with optimizations
- **.dockerignore** - Optimized build context
- **docker-compose.yml** - Local development setup

### ☸️ Kubernetes Deployment
- **helm/** - Complete Helm chart for Kubernetes deployment
- **k8s/** - Raw Kubernetes manifests for direct deployment
- **k8s-production.yaml** - Production-ready deployment configuration
- **values-production.yaml** - Production Helm values

### 🔧 Deployment Scripts
- **deploy.sh** - Local/development deployment automation
- **deploy-production.sh** - Production deployment script
- **deploy-production-k8s.sh** - Kubernetes production deployment
- **Makefile** - Common automation tasks

### 📚 Documentation
- **KUBERNETES.md** - Complete Kubernetes deployment guide
- **HELM-PUBLISHING.md** - Guide for publishing Helm charts
- Enhanced deployment documentation

## Quick Deployment

### Docker (Local)
```bash
docker-compose up -d
```

### Kubernetes (Production)
```bash
# Using Helm
helm install robotframework-dashboard ./helm/robotframework-dashboard \
  --namespace qa-auto-test \
  --values values-production.yaml

# Using raw manifests
kubectl apply -f k8s/
```

## Container Registry

Production images available at:
```
sankaram04/robotframework-dashboard:latest
```

## Full Documentation

👉 **[View complete fork features documentation →](https://github.com/mappadurai/robotframework-dashboard-standalone/blob/main/README-FORK.md)**

This includes:
- Detailed feature descriptions
- Configuration options
- Maintenance procedures
- Keeping up with upstream changes
- Contributing guidelines
