source = "git::git@github.com:timobartels/terraform-modules.git//services/webserver"
	
cluster_name = "test-module-cluster"
ec2_instance_count = 1
ec2_instance_name = "dev-instance"
ec2_instance_type = "t2.micro"
server_port = "8080"
ami_name = "ami-2d39803a"
environment_name = "stage"
terraform_state_bucket = "tbartels-terraform-state"
environment_region = "us-east-1"
