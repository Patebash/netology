# Создание дополнительных дисков через count
resource "yandex_compute_disk" "extra" {
  count = 3

  name = "${var.vm_name}-extra-disk-${count.index + 1}"
  size = var.disk_size
  type = var.disk_type
}

# Создание одиночной VM "storage"
resource "yandex_compute_instance" "storage" {
  name        = var.vm_name
  hostname    = var.vm_name
  platform_id = var.vm_web_platform_id

  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_boot_disk_size
      type     = var.vm_boot_disk_type
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
    nat                = var.vm_web_nat
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  # Подключение дополнительных дисков через dynamic + for_each
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.extra
    content {
      disk_id = secondary_disk.value.id
      mode    = "READ_WRITE"
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_key}"
  }
}
