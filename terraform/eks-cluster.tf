module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true
  enable_irsa                    = true

  cluster_addons = {
    vpc-cni = {
      most_recent = true
    }

    # Pin a stable version of EBS CSI Driver to avoid Terraform hanging
    aws-ebs-csi-driver = {
      addon_version = "v1.30.0-eksbuild.1"
    }
  }

  access_entries = {
    terraadmin = {
      principal_arn = "arn:aws:iam::982534374994:user/TerraAdmin"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    main = {
      name = "worker-group-1"

      subnet_ids     = module.vpc.private_subnets
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      # Ensure the node IAM role has EBS CSI permissions
      iam_role_arn = "arn:aws:iam::982534374994:role/eks-node-role"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}

# --------------------------------------
# Attach EBS policy to your existing node role
resource "aws_iam_role_policy_attachment" "ebs_csi_node_policy" {
  role       = "eks-node-role"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 20.0"

#   cluster_name    = local.cluster_name
#   cluster_version = "1.29"

#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   cluster_endpoint_public_access = true
#   enable_irsa                    = true

#   cluster_addons = {
#     vpc-cni = {
#       most_recent = true
#     }

#     aws-ebs-csi-driver = {
#       most_recent = true
#     }
#   }
#   # Give your IAM user Kubernetes admin access
#   access_entries = {
#     terraadmin = {
#       principal_arn = "arn:aws:iam::982534374994:user/TerraAdmin"

#       policy_associations = {
#         admin = {
#           policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
#           access_scope = {
#             type = "cluster"
#           }
#         }
#       }
#     }
#   }

#   eks_managed_node_group_defaults = {
#     ami_type = "AL2_x86_64"
#   }

#   # Reuse EXISTING NODE ROLE
#   eks_managed_node_groups = {
#     main = {
#       name = "worker-group-1"

#       subnet_ids     = module.vpc.private_subnets
#       instance_types = ["t3.medium"]

#       min_size     = 1
#       max_size     = 2
#       desired_size = 1

#       iam_role_arn = "arn:aws:iam::982534374994:role/eks-node-role"
#     }
#   }

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }
