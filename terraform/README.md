Structure file 

terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── rds/
    ├── redis/
    ├── alb/
    └── s3/
