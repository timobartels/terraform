terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {
        region   = "us-east-1"
        key      = "sample/stage/service/terraform.tfstate"
        bucket   = "tbartels-terraform-state"
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2-sample" {
    ami = "ami-2d39803a"
    count = 1
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.instance.id}"]

    user_data = <<-EOF
        #!/bin/bash
	echo "${data.terraform_remote_state.svc.public_ip}" > index.html
        nohup busybox httpd -f -p "${var.server_port}" &
        EOF

    tags {
        Name = "terraform-example"
    }
}

resource "aws_security_group" "instance" {
    name = "terraform-example-sg"
    ingress {
        from_port = "${var.server_port}"
        to_port = "${var.server_port}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

data "terraform_remote_state" "svc" {
  backend = "s3"

  config {
    bucket = "tbartels-terraform-state"
    key    = "sample/stage/other/svc2/terraform.tfstate"
    region = "us-east-1"
  }
}
