output "internal_ip_address_vm" {
  value = yandex_compute_instance.this[*].network_interface.0.ip_address
}

output "external_ip_address_vm" {
  value = yandex_compute_instance.this[*].network_interface.0.nat_ip_address
}

output "external_ip_address_load_balancer" {
  value = "${[for s in yandex_lb_network_load_balancer.this.listener: s.external_address_spec.*.address].0[0]}" 
}

resource "local_file" "public_key" {
    content  = var.public_ssh_key_path != "" ? var.public_ssh_key_path : tls_private_key.this[0].public_key_openssh
    filename = "id_rsa.pub"
}

resource "local_file" "private_key" {
    content  = var.public_ssh_key_path != "" ? "Find your ssh private key to '~/.ssh/id_rsa'" : tls_private_key.this[0].private_key_openssh
    filename = "id_rsa"
}
