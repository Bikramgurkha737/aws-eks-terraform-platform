# 🚀 AWS EKS Terraform Platform

> Production-grade Infrastructure as Code (IaC) platform built with Terraform using reusable modules, GitHub Actions CI, and Kubernetes-ready architecture.

---

## 📌 Overview

This project demonstrates how to build a scalable AWS infrastructure following DevOps and Site Reliability Engineering (SRE) best practices.

Current implementation includes:

- Modular Terraform architecture
- Environment-specific configuration
- Amazon VPC
- IAM Roles
- Amazon EKS
- Managed Node Groups
- GitHub Actions CI
- Helm support
- Kubernetes-ready infrastructure

---


## 🏗 Architecture

![AWS EKS Terraform Platform Architecture](architecture/aws-eks-architecture.png)

### Architecture Flow

GitHub → GitHub Actions → Terraform → AWS VPC → Amazon EKS → Managed Node Groups → Kubernetes Workloads

The platform is designed to integrate Prometheus and Grafana for Kubernetes monitoring and observability.


---

# 📂 Repository Structure

```text
aws-eks-terraform-platform/
│
├── .github/
│   └── workflows/
│       └── terraform-ci.yml
│
├── terraform/
│   ├── environments/
│   │   └── dev/
│   │
│   └── modules/
│       ├── eks/
│       ├── iam/
│       └── vpc/
│
├── kubernetes/
├── monitoring/
├── scripts/
└── README.md
```

---

# 🚀 Features

- Infrastructure as Code
- Modular Terraform
- AWS VPC
- IAM Roles
- Amazon EKS
- Managed Node Groups
- Environment separation
- GitHub Actions validation
- Kubernetes-ready

---

# ⚙️ Technology Stack

| Category | Technology |
|----------|------------|
| IaC | Terraform |
| Cloud | AWS |
| Container | Kubernetes |
| Package Manager | Helm |
| CI/CD | GitHub Actions |
| Version Control | Git |
| IDE | Visual Studio Code |

---

# ✅ Validation

```bash
terraform init
terraform fmt -recursive
terraform validate
```

---

# 📈 CI Pipeline

GitHub Actions automatically executes:

- Terraform Init
- Terraform Format Check
- Terraform Validate

Every Pull Request and Push is validated before merge.

---

# 🗺 Roadmap

## Phase 1 ✅

- Terraform Modules
- Environment Structure
- GitHub Actions

## Phase 2 🚧

- Architecture Diagram
- Terraform Documentation
- Remote State

## Phase 3

- Kubernetes Deployments
- Helm Charts

## Phase 4

- Prometheus
- Grafana
- OpenTelemetry

## Phase 5

- Argo CD
- GitOps
- Production CI/CD

---

# 👨‍💻 Author

**Bikram Thapa**

Site Reliability Engineer | DevOps Engineer

GitHub:

https://github.com/Bikramgurkha737