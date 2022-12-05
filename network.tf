module "modulo_tcloud_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tcloud_vpc"
  cidr = "172.16.0.0/16"

  azs = ["us-east-1a"]
  private_subnets = ["172.16.1.0/24"]
  public_subnets = ["172.16.2.0/24"]

  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false

  tags = {
    Terraform   = "true"
    Environment = "producao"
    Name        = "tcloud_vpc"
  }
}
