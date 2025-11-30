# Cloud-Project-Highly-Available-Web-Application-on-AWS
Technologies: Terraform (IaC), AWS (EC2, VPC, ALB, ASG, S3, IAM, NAT Gateway, Security Groups).

- Implemented Infrastructure as Code (IaC) with Terraform to define and provision the entire stack.
- Designed VPC networking with public and private subnets across two Availability Zones, incorporating an Internet Gateway and a NAT Gateway to securely manage inbound and outbound traffic.
- Enhanced application availability and fault tolerance by deploying an Auto Scaling Group (min:1, max:3) behind an Application Load Balancer (ALB) to distribute traffic and automatically scale based on demand.
- Strengthened security posture by isolating web servers in private subnets and implementing a bastion host (jump server) in a public subnet as a single, controlled entry point for SSH access.
