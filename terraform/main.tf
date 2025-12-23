provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = module.eks.cluster_auth_token # module provides this output
}

locals {
  cluster_name = var.clusterName
}
