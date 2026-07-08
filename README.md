# Cloud Native Application Platform

A cloud-native three-tier application built using Docker and Kubernetes to demonstrate container orchestration, application deployment, persistent storage, ingress routing, and autoscaling.

---

## Overview

This project consists of:

- Frontend (NGINX)
- Backend (Python Flask REST API)
- PostgreSQL Database

The application is deployed on a Kubernetes cluster using production-oriented concepts such as ConfigMaps, Secrets, Health Probes, Persistent Storage, Ingress, and Horizontal Pod Autoscaling (HPA).

---

## Technology Stack

- Python Flask
- HTML
- NGINX
- PostgreSQL
- Docker
- Docker Compose
- Kubernetes
- Kind
- Git & GitHub

---

## Project Structure

```text
Cloud-Native-Application-Platform/

├── backend/
├── frontend/
├── database/
├── k8s/
├── docs/
├── screenshots/
├── docker-compose.yaml
├── kind-config.yaml
└── README.md
```

---

## Kubernetes Features Implemented

- Namespace
- Deployments
- StatefulSet
- Services
- ConfigMap
- Secret
- Persistent Volume Claim (PVC)
- Startup, Readiness & Liveness Probes
- Resource Requests & Limits
- NGINX Ingress
- Horizontal Pod Autoscaler (HPA)

---

## Documentation

Additional documentation:

- [Architecture](docs/Architecture.md)
- [Deployment Guide](docs/Deployment-Guide.md)
- [Troubleshooting Guide](docs/Troubleshooting.md)
- [screenshots](docs/screenshots/)

---

## Future Enhancements

- GitHub Actions CI/CD
- Prometheus & Grafana
- Helm Charts
- Azure Kubernetes Service (AKS)

---