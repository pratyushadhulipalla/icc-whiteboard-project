module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  version      = "17.24.0"

  cluster_name = "icc-eks-cluster"
  cluster_version = "1.23"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  vpc_id       = "vpc-01ac46d93e07acd23"
  subnets      = ["subnet-0abdbd954e69b78ac", "subnet-0fe9bdf505e13eb72", "subnet-069dae1f6d57be531"]

  node_groups = {
    eks_nodes = {
      desired_capacity = 3
      max_capacity     = 3
      min_capaicty     = 3
      availabilityZones: ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
      instance_type = "m4.large"
      capacity_type  = "SPOT"
    }
  }

  manage_aws_auth = false
}
