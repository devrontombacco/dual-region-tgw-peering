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

## Deployment

## Features

## Technologies Used

## Technical Skills

## Troubleshooting Experience

## DevOps Best Practices

## Cleanup

## License

## Acknowledgments
