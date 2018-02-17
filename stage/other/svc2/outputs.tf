output "public_ip" {
	value = "${aws_instance.svc.public_ip}"
}
