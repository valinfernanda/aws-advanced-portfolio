provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.3"
  backend "local" {} # bisa ganti S3 remote backend untuk production
}
