output "public_ip" {
  value = "${module.webserver.instance_public_ip}"
}
