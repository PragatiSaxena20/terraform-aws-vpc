variable "sg_ingress_port" {
  description = "TCP port allowed for inbound SSH traffic"
  type        = number
  default     = 22
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

resource "aws_security_group" "my_sg" {
  name        = "MyStack-MySecurityGroup-kwG1kHlpu3dg"
  description = "Allow SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.sg_ingress_port
    to_port     = var.sg_ingress_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sg"
  }
}

output "sg_id" {
  description = "ID of the security group"
  value       = aws_security_group.my_sg.id
}
