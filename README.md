# Versions and Environment
```
Terraform v1.1.4
on darwin_amd64
+ provider registry.terraform.io/hashicorp/aws v3.67.0
```


# Usage
```
cd to resources/{app | infra}

terraform init -backend-config=../../backend/backend-{workspace}-app.tf
terraform init -backend-config=../../backend/backend-{workspace}-infra.tf

terraform plan  -var-file=./vars-{workspace.tfvars

terraform apply  -var-file=./vars-{workspace.tfvars

```
# Structure
```
.
├── README.md
├── backend
│   ├── backend-dev-app.tf
│   ├── backend-dev-infra.tf
│   └── backend-prod.tf
└── resources
    ├── app
    │   ├── compute
    │   │   ├── alb
    │   │   └── autoscale
    │   ├── data
    │   │   ├── rds
    │   │   └── redis
    │   ├── network
    │   │   └── secgroup
    │   ├── main.tf
    │   ├── variables.tf
    │   └── vars-{worksapce}.tfvars
    └── infra
        ├── main.tf
        ├── subnets
        │   └── main.tf
        └── vpc
        │    └── main.tf
        ├── main.tf
        ├── variables.tf
        └── vars-{worksapce}.tfvars
```

# Terraform State

The project was divided into 2 parts each have its own terraform state, to isolate/separate acutal infra and application

1. `resources/app` - Contains Resources needed to run the application such as EC2, RDS, ALB etc.

2. `resources/infra` - Contains the AWS cloud infra such as VPC, SUBNETS, ROUTING, etc.

# Questions

# Improvements