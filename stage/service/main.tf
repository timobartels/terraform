terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {
        region   = "us-east-1"
        key      = "sample/stage/service/terraform.tfstate"
        bucket   = "tbartels-terraform-state"
	encrypt  = true
    }
}

provider "aws" {
    region = "us-east-1"
}

module "webserver" {
   source = "git::git@github.com:timobartels/terraform-modules.git//services/webserver"
	
   cluster_name = "test-module-cluster"
   ec2_instance_count = 1
   ec2_instance_name = "dev-instance"
   ec2_instance_type = "t2.micro"
   server_port = "${var.server_port}"
}
