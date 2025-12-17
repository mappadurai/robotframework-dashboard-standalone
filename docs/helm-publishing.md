# ⎈ Helm Chart Publishing

For complete guide on publishing the Helm chart, see [HELM-PUBLISHING.md](https://github.com/mappadurai/robotframework-dashboard-standalone/blob/main/HELM-PUBLISHING.md) in the repository root.

## Publishing Options

### 1. GitHub Pages (Free & Easy)
Host your Helm chart repository on GitHub Pages for free.

### 2. Artifact Hub (Recommended)
Make your chart discoverable through the official Artifact Hub.

### 3. OCI Registry
Use GitHub Container Registry or other OCI-compliant registries.

## Quick Start

### GitHub Pages Setup
```bash
# Package chart
helm package helm/robotframework-dashboard -d docs/

# Create index
helm repo index docs/ --url https://YOUR_USERNAME.github.io/robotframework-dashboard-helm/

# Enable GitHub Pages in repository settings
```

### Users Install Via
```bash
helm repo add robotframework-dashboard https://mappadurai.github.io/robotframework-dashboard-standalone/
helm repo update
helm install my-dashboard robotframework-dashboard/robotframework-dashboard
```

## Full Documentation

👉 **[View complete Helm publishing guide →](https://github.com/mappadurai/robotframework-dashboard-standalone/blob/main/HELM-PUBLISHING.md)**

This includes:
- Detailed setup for GitHub Pages, Artifact Hub, and OCI registries
- Pre-publishing checklist (quality, documentation, versioning, security)
- Automated publishing with GitHub Actions
- Making your chart discoverable
- Example repository structure
- Maintenance and community best practices
