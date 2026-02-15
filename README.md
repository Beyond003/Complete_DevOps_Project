# 📦 Complete DevOps Project

An end-to-end DevOps project demonstrating Infrastructure as Code, containerization, and orchestration using modern DevOps tools and practices.

This project provisions infrastructure using Terraform, containerizes applications using Docker, and deploys services using Kubernetes.

---

## 🚀 Technologies Used

- Terraform (Infrastructure as Code)
- AWS (VPC, EC2, ALB, Auto Scaling, Security Groups, IAM)
- Docker
- Docker Compose
- Kubernetes
- Backend API
- Frontend Application
- Database Service

---

## 📐 Architecture Overview

This project follows a production-style DevOps workflow:

1. Infrastructure is provisioned using Terraform.
2. Application services are containerized using Docker.
3. Services are orchestrated using Kubernetes.
4. Database is configured separately.
5. Docker Compose is available for local development.

Insert architecture diagram below:

```
![Architecture Diagram](docs/images/Architecture1.png)
![Architecture Diagram](docs/images/Architecture2.png)
```

---

## 📁 Project Structure

```
Complete_DevOps_Project/
│
├── api/# Backend API service
├── app/# Frontend application
├── db/# Database configuration
├── k8s/# Kubernetes manifests
├── terraform/# Infrastructure as Code (Terraform)
│
├── docker-compose.yml
├── compose-commands.sh
├── db-commands.sh
└── README.md
```

---

## 🧱 Infrastructure Provisioning (Terraform)

Navigate to the terraform directory:

```
cd terraform
```

Initialize Terraform:

```
terraforminit
```

Preview changes:

```
terraform plan
```

Apply infrastructure:

```
terraform apply
```

```

---

## 🐳 Run Locally with Docker Compose

From the root directory:

```
docker-compose up--build
```

To stop services:

```
docker-compose down
```

---

## ☸️ Deploy to Kubernetes

Apply Kubernetes manifests:

```
kubectl apply-f k8s/
```

Check pods:

```
kubectl get pods
```

Check services:

```
kubectl get svc
```

---

## 🔐 Environment Variables

Make sure to configure required environment variables for:

- Database connection
- AWS credentials
- Application secrets

These can be configured using:

- `.env` files (for Docker Compose)
- Kubernetes Secrets
- Terraform variables

---

## 🛠️ Scripts

### compose-commands.sh

Helper commands for Docker Compose management.

### db-commands.sh

Database setup and management commands.

---

## 🌟 Features

- Infrastructure as Code using Terraform
- Containerized microservices architecture
- Kubernetes orchestration
- Local development support with Docker Compose
- Modular project structure
- Cloud-ready deployment design

---

## 🚧 Future Improvements

- CI/CD integration (GitHub Actions)
- Monitoring (Prometheus + Grafana)
- Logging (ELK Stack / CloudWatch)
- Helm chart packaging
- Automated testing pipeline
