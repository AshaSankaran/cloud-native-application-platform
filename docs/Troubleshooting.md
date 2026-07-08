# Troubleshooting Guide

This document summarizes the key issues encountered during the implementation of the Cloud Native Application Platform, along with their root causes and resolutions.

---

# 1. Backend Unable to Connect to PostgreSQL

## Issue

The backend application failed to establish a connection with the PostgreSQL database, resulting in application startup failures and unsuccessful database operations.

## Root Cause

The backend communicates with PostgreSQL using the Kubernetes Service name. An incorrect service name or invalid database environment variables prevented the backend from resolving the database endpoint.

## Resolution

- Verified the PostgreSQL Service name.
- Updated the backend database configuration to use the correct Kubernetes Service.
- Validated ConfigMap and Secret values.
- Redeployed the backend deployment.

---

# 2. Readiness Probe Returning HTTP 503

## Issue

Backend pods remained in the **Not Ready** state even though the container was running.

## Root Cause

The readiness probe was designed to verify database connectivity. During PostgreSQL startup or temporary database unavailability, the backend returned **HTTP 503**, causing Kubernetes to exclude the pod from the Service endpoints.

## Resolution

- Verified PostgreSQL availability.
- Confirmed successful database connectivity.
- Validated the readiness endpoint implementation.
- Once the database became available, the pods were automatically added back to the Service endpoints.

---

# 3. Application Code Changes Not Reflected

## Issue

Application changes were not visible after modifying the source code.

## Root Cause

Kind clusters use locally loaded Docker images. Updating the application source code alone does not update the running container image.

## Resolution

Whenever backend or frontend code changes are made:

- Rebuild the Docker image.
- Load the updated image into the Kind cluster.
- Update the deployment image version if required.
- Redeploy the application.

---

# 4. Database Reset After Namespace Migration

## Issue

Previously created database tables were no longer available after migrating the application from the **default** namespace to **cloud-native-app**.

## Root Cause

Persistent Volume Claims (PVCs) are namespace-scoped resources. Creating the StatefulSet in a new namespace resulted in a new PVC being provisioned, which created a fresh PostgreSQL data directory.

## Resolution

- Recreated the required database schema.
- Added an `init.sql` initialization script to automatically create tables during first-time database initialization.
- Included the script inside the PostgreSQL Docker image using `/docker-entrypoint-initdb.d`.

---

# 5. Ingress Not Accessible

## Issue

The application could not be accessed using the configured hostname (`cloudnative.local`) even though the Ingress resource was created successfully.

## Root Cause

The Kind cluster was initially created without mapping host ports **80** and **443** to the Kubernetes Ingress Controller. As a result, requests from the local machine never reached the cluster.

## Resolution

- Created a custom `kind-config.yaml`.
- Configured port mappings for ports **80** and **443**.
- Recreated the Kind cluster using the custom configuration.
- Installed the NGINX Ingress Controller.
- Added the hostname mapping to the local hosts file.

---

# 6. Horizontal Pod Autoscaler (HPA) Not Scaling

## Issue

The Horizontal Pod Autoscaler remained at the minimum replica count even though HPA was configured successfully.

## Root Cause

The Flask backend performs lightweight operations, resulting in very low CPU utilization under normal usage. Since the configured CPU utilization threshold was not exceeded, HPA did not trigger scaling.

## Resolution

- Installed and verified Metrics Server.
- Generated continuous traffic using a temporary BusyBox pod.
- Observed increased CPU utilization.
- Verified automatic scaling of backend replicas from **2** to **5** based on CPU usage.

---

# Useful Commands

```bash
# View all application resources
kubectl get all

# View Pods
kubectl get pods -o wide

# Describe a Pod
kubectl describe pod <pod-name>

# View Pod logs
kubectl logs <pod-name>

# View Ingress
kubectl get ingress

# View Horizontal Pod Autoscaler
kubectl get hpa

# View Resource Usage
kubectl top nodes
kubectl top pods

# Check Deployment Status
kubectl rollout status deployment/backend-deployment
```