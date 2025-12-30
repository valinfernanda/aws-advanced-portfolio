variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "key_name" {
  type = string
  description = "SSH key name for EC2 access"
}

variable "db_user" {
  type    = string
  default = "admin"
}

variable "db_pass" {
  type    = string
  description = "Database password"
  sensitive = true
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}
