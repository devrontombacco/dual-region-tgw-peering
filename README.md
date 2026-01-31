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

![Screenshot](/architecture.png)

## Architecture

### Design Decision: Flask Deployment

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
