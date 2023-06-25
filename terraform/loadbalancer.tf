
resource "yandex_lb_target_group" "this" {
  name      = "${local.preffix}this"
  labels         = var.labels
  dynamic "target" {
    for_each = [for s in yandex_compute_instance.this : {
      address = s.network_interface.0.ip_address
      subnet_id = s.network_interface.0.subnet_id
    }]

    content {
      subnet_id = target.value.subnet_id
      address   = target.value.address
    }
  }

}

resource "yandex_lb_network_load_balancer" "this" {
  name = "${local.preffix}this"
  labels         = var.labels
  listener {
    name = "${local.preffix}this"
    port = var.port_lb
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.this.id
    healthcheck {
      name = var.nlb_healthcheck.name
      http_options {
        port = var.nlb_healthcheck.port
        path = var.nlb_healthcheck.path
      }
    }
  }
}