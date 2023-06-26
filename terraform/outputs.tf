resource "local_file" "public_key" {
    content  = var.public_ssh_key_path != "" ? var.public_ssh_key_path : tls_private_key.this[0].public_key_openssh
    filename = "id_rsa.pub"
}

resource "local_file" "private_key" {
    content  = var.public_ssh_key_path != "" ? "Find your ssh private key to '~/.ssh/id_rsa'" : tls_private_key.this[0].private_key_openssh
    filename = "id_rsa"
}

output "internal_ip_address_vm" {
  value = flatten(yandex_compute_instance_group.this.instances[*].network_interface.0.ip_address)
  description = "List of internal IPs of instances"
}

output "external_ip_address_vm" {
  value = flatten(yandex_compute_instance_group.this.instances[*].network_interface.0.nat_ip_address)
  description = "List of external IPs of instances"
}

output "private_ssh_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.this[0].private_key_openssh
  sensitive = true
  description = "Show generated private key if not set"
}

output "external_ip_address_load_balancer" {
  value = "${[for s in yandex_alb_load_balancer.this.listener: s.endpoint.*.address.0.external_ipv4_address.0.address].0[0]}" 
  #value = "${[for s in yandex_lb_network_load_balancer.this.listener: s.external_address_spec.*.address].0[0]}" 
  #value = tolist(tolist(yandex_lb_network_load_balancer.this.listener).0.external_address_spec).0.address
  #value = tolist(tolist(tolist(tolist(yandex_alb_load_balancer.this.listener).0.endpoint).0.address).0.external_ipv4_address).0.address
  description = "External IP of the load balancer endpoint"
}