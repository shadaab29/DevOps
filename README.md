# Jenkins CI/CD Pipeline - Node.js App

This project demonstrates a basic CI/CD pipeline for a Node.js application using Jenkins.

## 🛠️ Tools Used
- Jenkins
- GitHub
- Docker
- Docker Hub

## 📌 Pipeline Stages
1. **Clone**: Pull code from GitHub repo
2. **Build**: Run `npm install`
3. **Test**: Run unit tests (optional)
4. **Docker Build**: Build Docker image
5. **Push to Docker Hub**: Authenticate & push image
6. **Deploy**: (Optional - shell script, SCP, or k8s)

## 🔐 Credentials Needed
- Docker Hub credentials saved in Jenkins (ID: `dockerhub-creds`)

## 📝 Prerequisites
- Jenkins installed with Docker and Git plugins
- Docker installed on Jenkins agent
- Node.js code (optional or dummy `package.json`)

## 🚀 How to Run
1. Add this repo in Jenkins as a pipeline job.
2. Set up DockerHub credentials in Jenkins.
3. Run the job.

---
