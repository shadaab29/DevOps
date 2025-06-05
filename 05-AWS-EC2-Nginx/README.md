# AWS EC2 Nginx Deployment using Bash

This project demonstrates how to:
- Launch an EC2 instance using AWS CLI
- Open port 80 via a security group
- Install and start Nginx via SSH
- Fully automate web server deployment on AWS

## 🛠️ Tools Used
- AWS CLI
- Bash
- EC2
- Nginx

---

## 🚀 Prerequisites

- AWS CLI configured (`aws configure`)
- A valid key pair uploaded in AWS (e.g., `shadaab-key.pem`)
- Permissions to create EC2, security groups

---

## ▶️ How to Run

```bash
chmod +x setup.sh
./setup.sh
