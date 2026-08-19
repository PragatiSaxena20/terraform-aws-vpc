module "networking" {
  source      = "./modules/networking"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  environment = var.environment
}

module "security" {
  source          = "./modules/security"
  vpc_id          = module.networking.vpc_id
  sg_ingress_port = var.sg_ingress_port
  environment     = var.environment
}
