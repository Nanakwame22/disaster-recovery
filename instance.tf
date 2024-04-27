resource "aws_instance" "primary_instance" {
  ami           = "ami-04e5276ebb8451442"
  instance_type = "t2.micro"
  subnet_id     = module.vpc_primary.public_subnets[0]

  tags = {
    Name = "Primary Instance"
  }

  provider = aws
}

resource "aws_instance" "secondary_instance" {
  ami           = "ami-032509850cf9ee54e"
  instance_type = "t2.micro"
  subnet_id     = module.vpc_secondary.public_subnets[0]

  tags = {
    Name = "Secondary Instance"
  }

  provider = aws.secondary
}
