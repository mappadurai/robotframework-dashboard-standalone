# ☸️ Kubernetes Deployment

For complete Kubernetes deployment documentation, see [KUBERNETES.md](https://github.com/mappadurai/robotframework-dashboard-standalone/blob/main/KUBERNETES.md) in the repository root.

## Quick Links

### Deployment Options

**Option 1: Direct Kubernetes Deployment**
```bash
./deploy.sh
```

**Option 2: Helm Deployment**
```bash
helm install robotframework-dashboard ./helm/robotframework-dashboard
```

### Key Features

- Production-ready Kubernetes manifests in `k8s/` directory
- Complete Helm chart in `helm/robotframework-dashboard/`
- Persistent storage for database and logs
- Health checks and resource limits
- Ingress configuration for external access

### Resources

- **Namespace**: robotframework-dashboard
- **Data Volume**: 5Gi for SQLite database
- **Logs Volume**: 2Gi for uploaded test results
- **Resources**: 200m CPU / 256Mi memory (requests), 500m CPU / 512Mi memory (limits)

## Full Documentation

👉 **[View complete Kubernetes deployment guide →](https://github.com/mappadurai/robotframework-dashboard-standalone/blob/main/KUBERNETES.md)**

This includes:
- Configuration options
- Storage setup
- Access methods (port-forward, ingress, LoadBalancer)
- Monitoring and health checks
- Scaling considerations
- Backup and restore procedures
- Troubleshooting guide
- Update and maintenance procedures
