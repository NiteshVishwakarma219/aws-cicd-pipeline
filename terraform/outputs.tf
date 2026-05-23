# ==========================================
# EC2 Public IPs
# ==========================================

output "server1_public_ip" {
  description = "Public IP of Server 1"

  value = aws_instance.server1.public_ip
}

output "server2_public_ip" {
  description = "Public IP of Server 2"

  value = aws_instance.server2.public_ip
}

# ==========================================
# Load Balancer DNS
# ==========================================

output "load_balancer_dns" {
  description = "Application Load Balancer DNS"

  value = aws_lb.alb.dns_name
}

# ==========================================
# VPC ID
# ==========================================

output "vpc_id" {
  description = "VPC ID"

  value = aws_vpc.main_vpc.id
}

# ==========================================
# Subnet IDs
# ==========================================

output "public_subnet_1" {
  description = "Public Subnet 1 ID"

  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  description = "Public Subnet 2 ID"

  value = aws_subnet.public_subnet_2.id
}

# ==========================================
# Security Group ID
# ==========================================

output "security_group_id" {
  description = "Security Group ID"

  value = aws_security_group.web_sg.id
}