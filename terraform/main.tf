module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source     = "./modules/ec2"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets
  key_name   = var.key_name
}

module "rds" {
  source     = "./modules/rds"
  subnet_ids = module.vpc.private_subnets
  db_user    = var.db_user
  db_pass    = var.db_pass
}

module "redis" {
  source     = "./modules/redis"
  subnet_ids = module.vpc.private_subnets
}

module "alb" {
  source       = "./modules/alb"
  subnet_ids   = module.vpc.public_subnets
  target_ec2   = module.ec2.instance_ids
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}
