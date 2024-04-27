module "vpc_primary" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name = "Primary-VPC"
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  providers = {
    aws = aws
  }
}

module "vpc_secondary" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name = "Secondary-VPC"
  cidr = "10.1.0.0/16"
  azs  = ["us-west-2a", "us-west-2b"]
  private_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
  public_subnets  = ["10.1.101.0/24", "10.1.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  providers = {
    aws = aws.secondary
  }
}
