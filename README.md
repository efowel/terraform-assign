# Versions and Environment
```
Terraform v0.15.5
on darwin_amd64
+ provider registry.terraform.io/hashicorp/google v3.52.0
+ provider registry.terraform.io/hashicorp/helm v2.4.1
+ provider registry.terraform.io/hashicorp/kubernetes v2.6.1
+ provider registry.terraform.io/hashicorp/tls v3.1.0
+ provider registry.terraform.io/vancluever/acme v2.7.0
```


# Usage
```
cd to projects/{google projects}

terraform init
terraform plan -out plan-out.terraform
terraform apply plan-out.terraform

To check

terraform plan -refresh-only

```
# Structure
```
demo-sre
    ├── docs            # files fore readme and notes
    ├── helm-charts     # storage location of helm charts (global)
    ├── modules         # storage location of moduels (global)
    ├── projects        # maps to Goole Porjects
    └── secrets         # storage location of sensitive data
```

# Cluster Login
```
gcloud container clusters get-credentials justin-sre
```

# Terraform State

# Questions

# Improvements