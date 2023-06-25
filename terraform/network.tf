resource "yandex_vpc_network" "this" {
  name = "${local.preffix}test"
  labels = var.labels
}

resource "yandex_vpc_subnet" "this" {
  for_each = toset(var.az)
  name = "${local.preffix}test-${each.value}"

  zone     = each.value
  network_id     = var.vpc_id != "" ? var.vpc_id : yandex_vpc_network.this.id
  v4_cidr_blocks = var.cide_block[index(var.az, each.value)]
  labels         = var.labels
}
