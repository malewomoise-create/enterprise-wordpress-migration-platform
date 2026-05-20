#############################################
# EC2 SECURITY GROUP
#############################################

resource "aws_security_group" "ec2_sg" {
  name = "ec2-sg"

  description = "Allow SSH and HTTP"

  vpc_id = aws_vpc.main.id

  #################################
  # SSH
  #################################

  ingress {
    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  #################################
  # HTTP
  #################################

  ingress {
    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  #################################
  # OUTBOUND
  #################################

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-security-group"
  }
}

#############################################
# RDS SECURITY GROUP
#############################################

resource "aws_security_group" "rds_sg" {
  name = "rds-sg"

  description = "Allow MySQL only from EC2"

  vpc_id = aws_vpc.main.id

  #################################
  # MYSQL
  #################################

  ingress {
    from_port = 3306
    to_port   = 3306

    protocol = "tcp"

    security_groups = [
      aws_security_group.ec2_sg.id
    ]
  }

  #################################
  # OUTBOUND
  #################################

  egress {
    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}