#############################################
# DB SUBNET GROUP
#############################################

resource "aws_db_subnet_group" "main" {
  name = "wordpress-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "wordpress-db-subnet-group"
  }
}

#############################################
# RDS MYSQL INSTANCE
#############################################

resource "aws_db_instance" "wordpress_db" {
  identifier = "wordpress-db"

  allocated_storage = 20

  engine = "mysql"

  engine_version = "8.0"

  instance_class = "db.t3.micro"

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  db_subnet_group_name = aws_db_subnet_group.main.name

  tags = {
    Name = "wordpress-rds"
  }
}