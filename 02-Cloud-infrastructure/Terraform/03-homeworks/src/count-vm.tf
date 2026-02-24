resource "yandex_compute_instance" "web" {

  depends_on = [
    yandex_compute_instance.db
  ]

  count = 2

  name        = "${var.vm_web_name}-${count.index + 1}"
  hostname    = "${var.vm_web_name}-${count.index + 1}"

  platform_id = var.vm_web_platform_id

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size = var.vms_resources["web"].hdd_size
      type = var.vms_resources["web"].hdd_type
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

  metadata = {
    ssh-keys           = "ubuntu:${local.ssh_key}"
  }

}
