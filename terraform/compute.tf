data "yandex_compute_image" "this" {
  family = var.image_family
}


resource "yandex_compute_instance" "this" {
  count = var.vm_count
  name        = "${local.preffix}${var.vm_name}-${count.index}"
  platform_id = "standard-v1"
  zone     = var.az[count.index % length(var.az)]
  labels         = var.labels
  allow_stopping_for_update = true

  resources {
    cores  = var.resources[2].cpu
    memory = var.resources[2].memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.this.id
      size = var.resources[2].disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this[var.az[count.index % length(var.az)]].id
    nat = true
  }

  metadata = {
    ssh-keys = var.public_ssh_key_path != "" ? var.public_ssh_key_path : "yc-user:${tls_private_key.this[0].public_key_openssh}"
  }

  provisioner "remote-exec" {
    inline = ["sudo yum install python -y"]
    connection {
      host = self.network_interface.0.nat_ip_address
      type = "ssh"
      user = "centos"
      private_key = var.public_ssh_key_path != "" ? "~/.ssh/id_rsa" : tls_private_key.this[0].private_key_openssh
      agent = true
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u centos -i '${self.network_interface.0.nat_ip_address},' --private-key '${var.public_ssh_key_path != "" ? "~/.ssh/id_rsa" : "./id_rsa"}' ansible/playbook.yml"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }
}
