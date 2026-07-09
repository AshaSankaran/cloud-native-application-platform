# Deployment Guide

This document explains how to deploy the Cloud Native Application Platform on a local Kubernetes cluster using Kind.

---

# Prerequisites

Install the following software before deployment.

- Docker Desktop
- kubectl
- Kind
- Git

Ensure Docker Desktop is running before creating the Kubernetes cluster.

---

# Clone Repository

```bash
git clone <repository-url>

cd Cloud-Native-Application-Platform
```

---

# Create Kind Cluster

```bash
kind create cluster --name cloud-native-cluster --config kind-config.yaml
```

Verify the cluster.

```bash
kubectl get nodes
```

---

# Build Docker Images

```bash
docker build -t backend-app:v1 ./backend

docker build -t frontend-app:v1 ./frontend
```

---

# Load Images into Kind

```bash
kind load docker-image backend-app:v8 --name cloud-native-cluster

kind load docker-image frontend-app:v3 --name cloud-native-cluster
```

---

# Deploy Kubernetes Resources

```bash
kubectl apply -R -f k8s/
```

---

# Verify Deployment

Check Pods.

```bash
kubectl get pods
```

Check Services.

```bash
kubectl get svc
```

Check Ingress.

```bash
kubectl get ingress
```

Check Horizontal Pod Autoscaler.

```bash
kubectl get hpa
```

---

# Access the Application

Open your browser and navigate to:

```
http://cloudnative.local
```

If using Kind, ensure:

- NGINX Ingress Controller is installed.
- `kind-config.yaml` maps host ports 80 and 443.
- The hosts file contains:

```
127.0.0.1 cloudnative.local
```
