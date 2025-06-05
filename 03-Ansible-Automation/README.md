# Ansible Automation - Basic Linux Tasks

This project uses Ansible to automate user creation and package installation across multiple Linux servers.

## 🔧 Tools Used
- Ansible
- SSH
- Linux (Ubuntu/Debian-based)

## 📁 Files
- `inventory` – List of target hosts
- `playbook.yml` – Ansible playbook to run

## ✅ What This Playbook Does
1. Installs Nginx on Debian-based systems
2. Installs `tree` command
3. Creates a new user: `devopsuser`
4. Grants passwordless sudo access to `devopsuser`

## 🚀 How to Run

### Step 1: Install Ansible
```bash
sudo apt update && sudo apt install ansible -y
