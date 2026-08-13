#!/bin/bash

## Terraform Installation

#(1) Update the package list and install prerequisites
set -euo pipefail

#(2) Install HashiCorp GPG key and repository
sudo apt update -y

#(3) Install Terraform
sudo apt install -y gnupg curl lsb-release

#(4) Add the HashiCorp GPG key and repository
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

#(5) Add the HashiCorp repository to the system's software sources
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

#(6) Update the package list and install Terraform
sudo apt update -y

#(7) Install Terraform
sudo apt install -y terraform


#(8) Verify the installation
terraform -version
