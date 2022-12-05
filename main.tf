data "aws_ami" "ubuntu_linux" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

module "modulo_tcloud_srv_sgp" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "tcloud_srv_sgp"
  description = "Security Group para o servidor host da aplicação em Docker"
  vpc_id      = module.modulo_tcloud_vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]
  egress_rules        = ["all-all"]
}

module "modulo_tcloud_srv" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Docker-Server"

  ami                    = data.aws_ami.ubuntu_linux.id
  instance_type          = "t2.micro"
  key_name               = "vockey"
  monitoring             = true
  vpc_security_group_ids = [module.modulo_tcloud_srv_sgp.security_group_id]
  subnet_id              = module.modulo_tcloud_vpc.public_subnets[0]
  iam_instance_profile   = "LabInstanceProfile"
  user_data              = file("./dependencias.sh")

  tags = {
    Terraform = "true"
  }
}

resource "aws_eip" "tcloud_srv_ip" {
  instance = module.modulo_tcloud_srv.id
  vpc      = true
}

output "bootcamp_aws_elastic_ip" {
  value       = "http://${aws_eip.bootcamp-ip.public_ip}:80"
  description = "Public IP and Port address of the instance"
}
