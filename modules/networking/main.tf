variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "${var.environment}-subnet"
  }
}

output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.my_vpc.id
}

output "subnet_id" {
  description = "ID of the subnet."
  value       = aws_subnet.my_subnet.id
}
