terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {
        region   = "us-east-1"
        key      = "sample/prod/service/terraform.tfstate"
        bucket   = "tbartels-terraform-state"
    }
}

provider "aws" {
    region = "us-east-1"
}

module "webserver" {
   source = "../../modules/services/webserver"

   cluster_name = "prod-module-cluster"
   ec2_instance_count = 1
   ec2_instance_name = "prod-instance"
   ec2_instance_type = "t2.micro"
   server_port = "${var.server_port}"
}
