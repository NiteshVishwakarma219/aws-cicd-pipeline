# ==========================================
# AWS Region
# ==========================================

variable "aws_region" {
  default = "ap-south-1"
}

# ==========================================
# EC2 AMI
# ==========================================

variable "ami_id" {
  description = "Ubuntu AMI ID"

  default = "ami-0f58b397bc5c1f2e8"
}

# ==========================================
# Instance Type
# ==========================================

variable "instance_type" {
  default = "t2.micro"
}

# ==========================================
# SSH Key Pair
# ==========================================

variable "key_name" {
  description = "AWS Key Pair Name"
}

# ==========================================
# Your Public IP
# ==========================================

variable "my_ip" {
  description = "Your Public IP"

  default = "0.0.0.0/0"
}