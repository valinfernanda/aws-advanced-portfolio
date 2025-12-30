output "ec2_public_ips" {
  value = module.ec2.public_ips
}

output "db_endpoint" {
  value = module.rds.endpoint
}

output "redis_endpoint" {
  value = module.redis.endpoint
}

output "alb_dns" {
  value = module.alb.dns_name
}
