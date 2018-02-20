terraform {
    required_version = ">= 0.10, < 0.12"
    backend "s3" {
        region   = "us-east-1"
        key      = "sample/stage/other/svc2/terraform.tfstate"
        bucket   = "tbartels-terraform-state"
	encrypt = true
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "svc" {
    ami = "ami-2d39803a"
    count = 1
    instance_type = "t2.micro"
    key_name = "ubuntu-home"
    vpc_security_group_ids = ["${aws_security_group.sg.id}"]

    tags {
        Name = "svc2"
    }
}

resource "aws_security_group" "sg" {
    name = "terraform-svc2-sg"
    ingress {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
