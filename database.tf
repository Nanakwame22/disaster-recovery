resource "aws_db_subnet_group" "primary_db_subnet_group" {
  name        = "primary-db-subnet-group"
  subnet_id  = "subnet-0222033a707783c79"

  tags = {
    Name = "My DB Subnet Group"
  }
}


resource "aws_db_instance" "primary_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "primarydb"
  username             = "dbadmin"
  password             = "yoursecurepassword"
  parameter_group_name = "default.mysql8.0"

  provider = aws
}

resource "aws_db_instance" "secondary_db" {
  instance_class       = "db.t3.micro"
  snapshot_identifier  = aws_db_instance.primary_db.snapshot_identifier
  provider             = aws.secondary
}

