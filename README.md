# Flask Backend and Express Frontend Deployment using AWS EC2 and Terraform

## Project Overview

This project demonstrates the deployment of a Flask backend application and an Express frontend application on a single AWS EC2 instance using Terraform.

Both applications are containerized using Docker and deployed automatically through Terraform provisioning and EC2 user-data scripts.

---

# Architecture

```text
User Browser
     |
     |
EC2 Public IP
     |
---------------------------------
|                               |
Frontend (Express) : Port 3000 |
Backend (Flask)    : Port 5000 |
---------------------------------
```

---

# Technologies Used

- AWS EC2
- AWS S3 (Terraform Backend)
- Terraform
- Docker
- Docker Compose
- Flask
- Express.js
- GitHub

---

# Project Structure

```text
STUDENT-APP/
│
├── backend/
│   ├── app.py
│   └── Dockerfile
│
├── frontend/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
├── docker-compose.yml
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── main.tf
│   ├── outputs.tf
│   ├── backend.tf
│   └── user-data.sh
│
└── README.md
```

---

# Prerequisites

Before starting, install the following tools:

## 1. Terraform

Install Terraform from:

https://developer.hashicorp.com/terraform/downloads

Verify installation:

```bash
terraform -version
```

---

## 2. AWS CLI

Install AWS CLI from:

https://aws.amazon.com/cli/

Verify installation:

```bash
aws --version
```

---

# AWS Configuration

Configure AWS CLI:

```bash
aws configure
```

Provide:

```text
AWS Access Key
AWS Secret Access Key
Region Name
Output Format
```

---

# Terraform Configuration Files

## provider.tf

Used to configure AWS provider and Terraform version.

---

## variables.tf

Contains reusable variables such as:

- AWS Region
- EC2 Instance Type
- Key Pair Name

---

## terraform.tfvars

Stores variable values.

Example:

```hcl
key_name = "student-key"
```

---

## main.tf

Creates:

- EC2 Instance
- Security Group
- User-data provisioning

---

## outputs.tf

Displays outputs such as:

- EC2 Public IP

---

## backend.tf

Stores Terraform state remotely in AWS S3.

---

## user-data.sh

Used to:

- Install Docker
- Install Git
- Clone GitHub repository
- Run Docker Compose

---

# Deployment Process

## Step 1: Initialize Terraform

Navigate to terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

---

## Step 2: Validate Configuration

```bash
terraform validate
```

---

## Step 3: Preview Infrastructure

```bash
terraform plan
```

---

## Step 4: Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

Terraform will:

- Create EC2 instance
- Configure Security Groups
- Execute user-data script
- Install Docker
- Clone GitHub repository
- Start Flask and Express containers

---

# Accessing the Applications

After successful deployment, Terraform outputs the EC2 Public IP.

## Frontend URL

```text
http://PUBLIC_IP:3000
```

---

## Backend URL

```text
http://PUBLIC_IP:5000
```

---

# Security Group Configuration

The following inbound ports are enabled:

| Port | Purpose |
|------|----------|
| 22 | SSH Access |
| 3000 | Express Frontend |
| 5000 | Flask Backend |

---

# Verify Running Containers

SSH into EC2:

```bash
ssh -i student-key.pem ec2-user@PUBLIC_IP
```

Check containers:

```bash
docker ps
```

---

# Terraform State Management

Terraform remote backend is configured using AWS S3.

Benefits:

- Centralized state management
- Collaboration support
- State recovery
- Improved reliability

---

# Troubleshooting

## Docker Containers Not Running

Run:

```bash
docker ps -a
```

Restart:

```bash
docker compose up -d
```

---

## Frontend Cannot Connect to Backend

Ensure frontend uses:

```text
http://PUBLIC_IP:5000
```

instead of:

```text
localhost:5000
```

---

## Port Not Accessible

Verify Security Group allows:

- Port 3000
- Port 5000

---

# Terraform Commands Summary

## Initialize

```bash
terraform init
```

## Validate

```bash
terraform validate
```

## Plan

```bash
terraform plan
```

## Apply

```bash
terraform apply
```

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Screenshots Included

- Terraform Init
- Terraform Plan
- Terraform Apply
- EC2 Running Instance
- Security Group Rules
- Docker Containers Running
- Frontend Output
- Backend Output

---

# GitHub Repository

Add your GitHub repository link here:

```text
https://github.com/YOUR_USERNAME/YOUR_REPOSITORY
```

---

# Author

Name: Your Name

Role: DevOps / Cloud Engineering Assignment
