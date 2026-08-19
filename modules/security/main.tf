// Declare input variables
variable "sg_ingress_port" {}
variable "environment" {}
variable "vpc_id" {}

// Security Group resource
resource "aws_security_group" "my_sg" {
  vpc_id      = var.vpc_id
  description = "Allow SSH access"

  ingress {
    from_port   = var.sg_ingress_port
    to_port     = var.sg_ingress_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-sg"
  }
}

// Export SG ID
output "sg_id" {
  value = aws_security_group.my_sg.id
}
