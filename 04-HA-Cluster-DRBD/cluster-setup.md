# High Availability Cluster with DRBD + Pacemaker + Corosync

## 🧰 Tools Used
- DRBD (Distributed Replicated Block Device)
- Pacemaker (Cluster Resource Manager)
- Corosync (Messaging Layer)
- Two Ubuntu VMs (Node1 & Node2)

---

## 🖥️ Setup Environment

| Hostname | IP Address      | Role     |
|----------|------------------|----------|
| node1    | 192.168.56.101   | Primary  |
| node2    | 192.168.56.102   | Secondary|

Both nodes should:
- Have 2 CPUs, 2GB RAM, Ubuntu 22.04
- Have passwordless SSH access
- Be time synced (`chrony` or `ntp`)

---

## 🔧 Step-by-Step Setup

### Step 1: Install DRBD, Corosync, Pacemaker

```bash
sudo apt update
sudo apt install -y drbd-utils corosync pacemaker pcs
