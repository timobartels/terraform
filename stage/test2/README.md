# README

### How to initialize Terraform backend and get updates from module in remote repo?
Command:  
```
terraform init -from-module=github.com/timobartels/terraform-modules/test2 -backend-config=backend.conf  
```

### How to execute the terraform plan/apply?
Command:  
```
terraform plan -out=plan -var-file=config.tfvars  
  
terraform apply plan
```
