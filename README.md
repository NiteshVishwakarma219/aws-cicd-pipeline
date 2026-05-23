# 🚀 End-to-End CI/CD Pipeline with Automated Deployment

<p align="center">

<img src="https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws">
<img src="https://img.shields.io/badge/Docker-Containerization-blue?style=for-the-badge&logo=docker">
<img src="https://img.shields.io/badge/GitHub%20Actions-CI/CD-black?style=for-the-badge&logo=githubactions">
<img src="https://img.shields.io/badge/Terraform-IaC-purple?style=for-the-badge&logo=terraform">
<img src="https://img.shields.io/badge/Nginx-Reverse%20Proxy-green?style=for-the-badge&logo=nginx">

</p>

---

# 📌 Project Overview

This project demonstrates a **Production-Grade CI/CD Pipeline** that automates the complete software delivery lifecycle using:

✅ GitHub Actions  
✅ Docker  
✅ AWS EC2  
✅ Terraform  
✅ Nginx  
✅ Trivy Security Scanning  
✅ Zero-Downtime Deployment  

The pipeline automatically builds, tests, scans, and deploys a containerized Flask application whenever code is pushed to GitHub.

---

# 🔥 Key Features

✅ Automated CI/CD Pipeline  
✅ Dockerized Application Deployment  
✅ Infrastructure as Code using Terraform  
✅ AWS EC2 Multi-Instance Deployment  
✅ Application Load Balancer  
✅ Nginx Reverse Proxy & Load Balancing  
✅ Trivy Security Vulnerability Scanning  
✅ Zero-Downtime Deployment Strategy  
✅ Health Check & Rollback Mechanism  
✅ Production-Style Cloud Architecture  

---

# 🏗️ Architecture Diagram

```text
Developer Push Code
        │
        ▼
GitHub Actions Pipeline
        │
 ┌──────┴──────┐
 │             │
 ▼             ▼
Build Docker   Trivy Security Scan
Image
 │
 ▼
Push Docker Image to DockerHub
 │
 ▼
Deploy to AWS EC2 Servers
 │
 ▼
Nginx Reverse Proxy
 │
 ▼
AWS Application Load Balancer
 │
 ▼
Users Access Application
```

---

# 📂 Project Structure

```bash
end-to-end-cicd-pipeline/
│
├── app/
│   ├── app.py
│   ├── requirements.txt
│   └── templates/
│       └── index.html
│
├── docker/
│   └── Dockerfile
│
├── nginx/
│   └── nginx.conf
│
├── scripts/
│   ├── deploy.sh
│   ├── health-check.sh
│   └── rollback.sh
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
│
├── .github/
│   └── workflows/
│       └── cicd.yml
│
├── docker-compose.yml
│
└── README.md
```

---

# ⚙️ Technologies Used

| Technology | Purpose |
|---|---|
| Python Flask | Demo Application |
| Docker | Containerization |
| GitHub Actions | CI/CD Automation |
| AWS EC2 | Cloud Deployment |
| AWS ALB | Load Balancing |
| Terraform | Infrastructure Provisioning |
| Trivy | Security Scanning |
| Nginx | Reverse Proxy |
| Shell Scripting | Deployment Automation |

---

# 🚀 CI/CD Workflow

## 1️⃣ Developer Pushes Code

Code is pushed to GitHub repository.

---

## 2️⃣ GitHub Actions Triggered

The pipeline automatically starts.

---

## 3️⃣ Docker Image Build

Application image is created using Docker.

---

## 4️⃣ Security Scan

Trivy scans Docker image for vulnerabilities.

---

## 5️⃣ Docker Image Push

Secure image is pushed to DockerHub.

---

## 6️⃣ Deployment to AWS

Application is deployed automatically to EC2 instances.

---

## 7️⃣ Load Balancer Routing

Traffic is distributed across multiple servers.

---

# 🔐 Security Features

✅ Docker Image Vulnerability Scanning using Trivy  
✅ Restricted Security Groups  
✅ SSH Key Authentication  
✅ Infrastructure Isolation using VPC  
✅ Health Monitoring Scripts  

---

# 🌍 Infrastructure Components

| AWS Service | Purpose |
|---|---|
| VPC | Network Isolation |
| EC2 | Application Hosting |
| ALB | Traffic Distribution |
| Security Groups | Firewall Rules |
| Internet Gateway | Internet Access |
| Public Subnets | High Availability |

---

# 🚀 Deployment Commands

## Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/end-to-end-cicd-pipeline.git
```

---

## Build Docker Image

```bash
docker build -t cicd-app -f docker/Dockerfile .
```

---

## Run Container

```bash
docker run -d -p 5000:5000 cicd-app
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Create Infrastructure

```bash
terraform apply -auto-approve
```

---

# 🔥 GitHub Secrets Required

Go to:

GitHub Repository → Settings → Secrets → Actions

Add the following secrets:

```text
DOCKER_USERNAME
DOCKER_PASSWORD
EC2_HOST
EC2_KEY
```

---

# 📸 Screenshots

Add screenshots here:

✅ GitHub Actions Pipeline  
✅ AWS EC2 Instances  
✅ Docker Containers  
✅ Terraform Apply Output  
✅ Load Balancer  
✅ Running Application  

---

# 🎯 Learning Outcomes

By building this project, I learned:

✅ CI/CD Pipeline Automation  
✅ Docker Containerization  
✅ AWS Infrastructure Management  
✅ Infrastructure as Code (Terraform)  
✅ Secure Deployment Practices  
✅ Production-Level DevOps Workflow  
✅ Cloud Networking Concepts  
✅ Load Balancing & High Availability  

---

# 🔥 Resume Description

```text
Designed and implemented a production-grade CI/CD pipeline using GitHub Actions, Docker, Terraform, Nginx, and AWS EC2.

Automated application build, security scanning, containerization, and deployment processes with zero-downtime deployment strategy using multiple EC2 instances behind a load balancer.

Integrated Trivy vulnerability scanning and Infrastructure as Code (Terraform) to simulate real-world DevOps and cloud deployment workflows.
```

---

# 👨‍💻 Author

## Nitesh Vishwakarma

Cloud | DevOps | AWS | Security | Automation

---

# ⭐ Support

If you found this project useful:

⭐ Star the Repository  
🍴 Fork the Repository  
🛠️ Contribute to the Project  

---

# 🚀 Future Improvements

- Kubernetes Deployment (EKS)
- Jenkins Integration
- SonarQube Code Scanning
- HTTPS using ACM
- Auto Scaling Group
- Prometheus + Grafana Monitoring
- Slack Notifications
- Blue-Green Deployment

---

# 📜 License

This project is licensed under the MIT License.

---

<p align="center">

🔥 Production-Grade DevOps Project 🔥

</p>
