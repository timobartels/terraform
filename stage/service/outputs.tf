output "public_ip" {
    value = "${aws_instance.ec2-sample.*.public_ip}"
}
output "svc2_public_ip" {
	value = "${data.terraform_remote_state.svc.public_ip}"
}
