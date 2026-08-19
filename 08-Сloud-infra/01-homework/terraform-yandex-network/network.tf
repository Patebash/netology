resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.public_subnet_cidr]
}

resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [var.private_subnet_cidr]
  route_table_id = yandex_vpc_route_table.private.id
}
