variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-project"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Example Amazon Linux 2 in us-east-1
}

variable "ec2_key_name" {
  description = "SSH Key Pair name"
  type        = string
  default     = "VPN-Monitoring" # Replace with your key pair name
}
