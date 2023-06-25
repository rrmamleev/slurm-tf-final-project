packer {
  required_plugins {
    yandex = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/yandex"
    }
  }
}

source "yandex" "this" {
  source_image_family = var.source_image_family
  ssh_username        = var.ssh_username
  use_ipv4_nat        = var.use_ipv4_nat
  image_description   = var.image_description
  image_family        = var.image_family
  image_name          = "nginx-${var.image_tag}"
  disk_type           = var.disk_type
}

build {
  sources = ["source.yandex.this"]

  provisioner "ansible" {
    user = "centos"
    playbook_file = "ansible/playbook.yml"
    ansible_ssh_extra_args = ["-o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedKeyTypes=+ssh-rsa"]
  }
}