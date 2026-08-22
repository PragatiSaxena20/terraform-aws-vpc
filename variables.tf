variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string

  default = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block."
  }
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet."
  type        = string

  default = "10.0.1.0/24"

  validation {
    condition     = can(cidrhost(var.subnet_cidr, 0))
    error_message = "subnet_cidr must be a valid CIDR block."
  }
}

variable "sg_ingress_port" {
  description = "TCP port allowed for inbound traffic."
  type        = number

  default = 22

  validation {
    condition     = var.sg_ingress_port >= 1 && var.sg_ingress_port <= 65535
    error_message = "sg_ingress_port must be between 1 and 65535."
  }
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  default = "dev"

  validation {
    condition     = contains(["dev", "qa", "stage", "prod"], var.environment)
    error_message = "environment must be one of dev, qa, stage, or prod."
  }
}
