# Inception-of-Things-42

## Overview
The **Inception-of-Things-42** project is designed to introduce fundamental concepts of Kubernetes/k3s. It leverages tools like **Vagrant**, **Docker**, **Kubernetes**, and **Argo CD** to orchestrate and manage containerized applications. Inspired by the 42 School curriculum, this project provides hands-on experience with DevOps/GitOps practices.

This repository demonstrates how to:
1. Set up lightweight Kubernetes clusters (K3s) on virtual machines.
2. Deploy and manage containerized applications using Kubernetes.
3. Implement GitOps practices with Argo CD for continuous deployment with both Github/Gitlab.

---

## Main Objectives
1. **Virtualization with Vagrant**:
   - Create and configure virtual machines (VMs) using Vagrant.
   - Install K3s, a lightweight Kubernetes distribution, on these VMs.

2. **Container Orchestration with Kubernetes**:
   - Use Kubernetes manifests (YAML files) to define and deploy services, deployments, and ingress configurations.
   - Route external traffic using an ingress controller.

3. **GitOps with Argo CD**:
   - Synchronize application states between a Git repository and Kubernetes clusters using Argo CD.
   - Automate the deployment process through Git-based version control.

4. **CI/CD Integration with GitLab**:
   - Build CI/CD pipelines with GitLab for automated testing and deployment.
   - Combine GitLab CI/CD and Argo CD to achieve a robust and automated deployment pipeline.

---

## Project Architecture
1. **VM Setup (p1)**:
   - **Vagrant** initializes VMs with predefined specifications (CPU, memory, etc.).
   - A provisioning script installs and configures **K3s**, creating a lightweight Kubernetes cluster.

2. **Application Deployment (p2)**:
   - Applications are defined using Kubernetes manifests.
   - Includes deployments (container replicas), services (exposing applications), and ingress resources (routing traffic).

3. **GitOps and Argo CD (p3)**:
   - **Argo CD** monitors the Git repository for changes.
   - Kubernetes manifests define the desired state of applications.
   - Argo CD applies repository changes to the cluster automatically.

4. **Bonus: GitLab CI/CD**:
   - GitLab CI/CD pipelines automate the building, testing, and deployment of applications.
   - Combined with Argo CD, GitLab handles CI while Argo CD manages deployments.

---

## Technology Stack
- **Vagrant**: Virtual machine provisioning and management.
- **K3s**: Lightweight Kubernetes distribution for running Kubernetes clusters.
- **Docker**: Containerization of applications.
- **Kubernetes**: Orchestration of containerized applications.
- **Argo CD**: Continuous deployment tool implementing GitOps principles.
- **GitLab** (optional): CI/CD pipelines for automated testing and deployment.

---

## How It Works
1. **VM Initialization**:
   - The `Vagrantfile` initializes VMs with predefined specifications.
   - K3s is installed and configured using the `provision.sh` script.

2. **Kubernetes Cluster Setup**:
   - The Kubernetes cluster runs multiple applications defined in manifests.
   - Each application has its deployment, service, and ingress configuration.

3. **GitOps with Argo CD**:
   - Argo CD monitors the repository for Kubernetes manifests updates.
   - Changes are automatically applied to the cluster.

4. **CI/CD Pipeline**:
   - GitLab pipelines build and test the application code.
   - Argo CD ensures tested code is deployed to the cluster.
