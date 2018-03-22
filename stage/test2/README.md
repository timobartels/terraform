# README

## Purpose  
Reference an entire repo containing Terraform modules, and use nested modules within that repo.

### Setup
From 'terraform' instantiation repo, a ```config.tfvars``` along with a ```backend.conf``` will be sufficient to call nested modules.  
The ```config.tfvars``` will refer to the modules repository, where there is a ```main.tf``` in the root directory.   
This ```main.tf``` in turn will call a submodule which is having the entire code/logic to build the test EC2 instance.  

### How to initialize Terraform backend and get updates from module in remote repo?
Command:  
```
terraform init -from-module=github.com/timobartels/terraform-modules -backend-config=backend.conf  
```

### How to execute the terraform plan/apply?
Command:  
```
terraform plan -out=plan -var-file=config.tfvars  
  
terraform apply plan
```
