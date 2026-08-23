resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.public_subnet_cidr]
}
