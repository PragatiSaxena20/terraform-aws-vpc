// modules/networking/main.tf

// Declare input variables
variable "vpc_cidr" {}
variable "subnet_cidr" {}
variable "environment" {}

// VPC resource
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.environment}-vpc"
  }
}

// Subnet resource
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "${var.environment}-subnet"
  }
}

// Export IDs so root outputs.tf can reference them
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}
