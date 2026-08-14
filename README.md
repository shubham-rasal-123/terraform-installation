# 🌍 Terraform Installation on AWS EC2

A simple, automated Bash script to install **Terraform** (via the official HashiCorp APT repository) on an **AWS EC2** instance (Debian/Ubuntu-based).

![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![AWS](https://img.shields.io/badge/Cloud-AWS%20EC2-FF9900?logo=amazonaws&logoColor=white)
![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC?logo=terraform&logoColor=white)
![Platform](https://img.shields.io/badge/OS-Debian%2FUbuntu-orange?logo=ubuntu)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

---

## 📋 Overview

This repository contains a one-shot shell script that automates the installation of **Terraform** from HashiCorp's official APT repository — including GPG key verification — on a freshly launched **AWS EC2** instance, so you can go from a blank EC2 VM to a working `terraform` CLI in minutes.

---

## ✨ What the Script Does

| Step | Action |
|------|--------|

| 1️⃣ | Enables strict mode (`set -euo pipefail`) for safer script execution |
| 2️⃣ | Updates the system package index |
| 3️⃣ | Installs prerequisites: `gnupg`, `curl`, `lsb-release` |
| 4️⃣ | Downloads and adds the HashiCorp GPG signing key |
| 5️⃣ | Adds the official HashiCorp APT repository (matched to your OS codename) |
| 6️⃣ | Refreshes the package list |
| 7️⃣ | Installs Terraform |
| 8️⃣ | Verifies the installation by printing the Terraform version |

---

## 🛠️ Prerequisites

- An AWS account with permission to launch EC2 instances
- An EC2 instance running Ubuntu/Debian (e.g. **Ubuntu 22.04/24.04 LTS**, `t2.micro` is enough for just the CLI)
- A Security Group allowing the following inbound port:

  | Port | Purpose |
  |------|---------|

  | 22   | SSH access |

- A key pair (`.pem`) to SSH into the instance
- `sudo` privileges on the instance
- Outbound internet access to reach `apt.releases.hashicorp.com`

---

## ☁️ Step 1: Launch the EC2 Instance

1. Go to **AWS Console → EC2 → Launch Instance**
2. Choose an **Ubuntu Server LTS** AMI
3. Select an instance type (`t2.micro` is sufficient for the Terraform CLI alone)
4. Configure the **Security Group** to allow inbound traffic on port **22**
5. Select or create a key pair for SSH access
6. Launch the instance

---

## 🔑 Step 2: Connect to the Instance

```bash
chmod 400 your-key.pem
ssh -i "your-key.pem" ubuntu@<your-ec2-public-ip>
```

---

## 📦 Step 3: Run the Installation Script

Clone the repository and run the script on your EC2 instance:

```bash
git clone https://github.com/shubham-rasal-123/terraform-installation.git
cd terraform-installation
chmod +x install-terraform.sh
./install-terraform.sh
```

---

## ✅ Step 4: Verify the Installation

Confirm Terraform is installed and check its version:

```bash
terraform -version
```

You should see output similar to:

```text
Terraform v1.x.x
on linux_amd64
```

---

## 📁 Repository Structure

```text
terraform-installation/
├── install-terraform.sh    # Main installation script
├── README.md                 # Project documentation
```

---

## 🚀 Getting Started with Terraform

Once installed, initialize a working directory containing Terraform configuration files:

```bash
terraform init
terraform plan
terraform apply
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open a pull request or an issue.

---

## ⚠️ Notes

- Restrict the **Security Group** inbound rule for port `22` to your own IP where possible, rather than leaving it open to `0.0.0.0/0`.
- Remember to **stop or terminate** the EC2 instance when not in use to avoid unnecessary AWS charges.
- If you plan to use this instance to run `terraform apply` against AWS itself, attach an **IAM role** with the appropriate permissions instead of hardcoding AWS credentials on the instance.

---
