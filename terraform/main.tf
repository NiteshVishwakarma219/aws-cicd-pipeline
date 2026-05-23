# ==========================================
# AWS Provider
# ==========================================

provider "aws" {
  region = var.aws_region
}

# ==========================================
# VPC
# ==========================================

resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cicd-vpc"
  }
}

# ==========================================
# Public Subnets
# ==========================================

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

# ==========================================
# Internet Gateway
# ==========================================

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "cicd-igw"
  }
}

# ==========================================
# Route Table
# ==========================================

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

# ==========================================
# Route Table Associations
# ==========================================

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

# ==========================================
# Security Group
# ==========================================

resource "aws_security_group" "web_sg" {
  name        = "cicd-security-group"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask App"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cicd-sg"
  }
}

# ==========================================
# EC2 Instances
# ==========================================

resource "aws_instance" "server1" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_1.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "cicd-server-1"
  }
}

resource "aws_instance" "server2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet_2.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "cicd-server-2"
  }
}

# ==========================================
# Application Load Balancer
# ==========================================

resource "aws_lb" "alb" {
  name               = "cicd-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.web_sg.id]

  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  tags = {
    Name = "cicd-load-balancer"
  }
}

# ==========================================
# Target Group
# ==========================================

resource "aws_lb_target_group" "tg" {
  name     = "cicd-target-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main_vpc.id

  health_check {
    path = "/"
    port = "5000"
  }
}

# ==========================================
# Attach Instances to Target Group
# ==========================================

resource "aws_lb_target_group_attachment" "tg_attachment1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.server1.id
  port             = 5000
}

resource "aws_lb_target_group_attachment" "tg_attachment2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.server2.id
  port             = 5000
}

# ==========================================
# Load Balancer Listener
# ==========================================

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}