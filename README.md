# Dual Region Transit Gateway Peering with Ansible configuration

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)

## Overview

This project demonstrates a multi-region AWS infrastructure with automated configuration management, using an enterprise-level networking set up. The infrastructure spans two AWS regions (Ireland and London) connected via Transit Gateway peering, enabling seamless cross-region communication between Virtual Private Clouds (VPCs). Four Nginx web servers are distributed across both regions, all configured to act as reverse proxies to a centralized Flask application backend. Key Architecture Highlights:

- Multi-Region Deployment: Infrastructure deployed across eu-west-1 (Ireland) and eu-west-2 (London) for geographic distribution
- Transit Gateway Peering: Enables private network connectivity between regions without VPC peering complexity
- Infrastructure as Code: Entire infrastructure defined and managed through Terraform, ensuring reproducibility and version control
- Configuration Management: Ansible automates server configuration across all instances, eliminating manual setup and ensuring consistency
- Reverse Proxy Architecture: All four Nginx servers can proxy requests to a Flask backend, assiting with load distribution.

## Architecture

![Screenshot](/architecture.png)

### Network Topology

2 Regions

- EU-WEST-1 (Ireland)
- EU-WEST-2 (LONDON)
  5 VPCs, of which 3 in Ireland and 2 in London
- VPC-1: 10.0.0.0/16 (Ireland)
- VPC-2: 10.1.0.0/16 (Ireland)
- VPC-3: 10.2.0.0/16 (Ireland)
- VPC-4: 10.100.0.0/16 (London)
- VPC-5: 10.101.0.0/16 (London)
- 2 Transit Gateways; 1 in each region
- Transit Gateways are connected through peering
- All VPCs have a public subnet, with their own Inter Gateway

### Design Decision: Flask Deployment

**Note:**
The original design placed Flask on a private subnet EC2 instance.
During implementation, this was changed to deploy Flask on a public instance (loaded with Nginx) to avoid NAT Gateway costs (~$32/month) for this proof-of-concept project. In production, Flask should be deployed on private instances with NAT Gateway for proper security isolation.

## Prerequisites before installation

Before deploying this infrastructure, ensure you have the following tools and access configured:

- AWS Access Key ID and Secret Access Key configured
- Terraform (v1.0+)
- Ansible (V2.9+)
- SSH Key Pair
- You will need to know your own ip (you can use https://ipv4.icanhazip.com)

## Deployment

Here's how you can run the project:

### Step 1: Clone the Repository

```bash
git clone
cd dual-region-tgw-peering
```

### Step 2: Configure Terraform Variables

Create a `terraform.tfvars` file or update variables in your Terraform configuration:

```bash
# Example terraform.tfvars
my_ip_address = "YOUR_PUBLIC_IP"  # Your current public IP for SSH access
```

To find your public IP:

```bash
curl https://ipv4.icanhazip.com
```

### Step 3: Deploy Infrastructure with Terraform

Initialize Terraform and download required providers:

```bash
terraform init
```

Review the infrastructure plan:

```bash
terraform plan
```

Apply the configuration to create all AWS resources:

```bash
terraform apply
```

Type `yes` when prompted to confirm. This process takes approximately 5-10 minutes.

### Step 4: Retrieve Output Values

After Terraform completes, get the public IP addresses of your EC2 instances:

```bash
terraform output
```

Note these IP addresses - you'll need them for the Ansible inventory.

### Step 5: Configure Ansible Inventory

Navigate to the Ansible directory:

```bash
cd ansible
```

**Note:** The `inventory.ini` file contains placeholder IP addresses from the original deployment. Replace these with your own IP addresses from the Terraform output.

Update `inventory.ini` with the IP addresses from Terraform output:

```ini
[nginx_ireland]



[nginx_london]



[nginx_servers:children]
nginx_ireland
nginx_london

[flask_servers]


[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/my_aws_key
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
```

### Step 6: Test Ansible Connectivity

Verify Ansible can reach all servers:

```bash
ansible all -i inventory.ini -m ping
```

Expected output: All servers should return `SUCCESS` with `"ping": "pong"`.

### Step 7: Install and Configure Nginx

Deploy Nginx to all public servers:

```bash
ansible-playbook -i inventory.ini nginx-playbook.yml
```

This installs Nginx on all four public-facing EC2 instances.

### Step 8: Deploy Flask Application

Install Flask on the backend server:

```bash
ansible-playbook -i inventory.ini flask-playbook.yml
```

This creates a simple Flask application running on port 5000.

### Step 9: Configure Nginx Reverse Proxy

Configure all Nginx servers to proxy requests to Flask:

```bash
ansible-playbook -i inventory.ini nginx-proxy-config.yml
```

### Step 10: Verify Deployment

Test the application by visiting any of the four public IP addresses in a web browser:

```
http://<nginx-public-ip-1>
http://<nginx-public-ip-2>
http://<nginx-public-ip-3>
http://<nginx-public-ip-4>
```

All should display: **"Hello from Flask backend!"**

## Features

## Technologies Used

## Technical Skills

## Troubleshooting Experience

## DevOps Best Practices

## Cleanup

To destroy all infrastructure and avoid ongoing AWS charges:

```bash
terraform destroy
```

## License

## Acknowledgments
