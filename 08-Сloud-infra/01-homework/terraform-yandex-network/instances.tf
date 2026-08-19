### NAT-instance

resource "yandex_compute_instance" "nat" {
  name     = "nat-instance"
  hostname = "nat-instance"
  zone     = var.default_zone

  resources {
    cores         = var.nat_vm_resources.cores
    memory        = var.nat_vm_resources.memory
    core_fraction = var.nat_vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
      size     = var.nat_vm_disk.size
      type     = var.nat_vm_disk.type
    }
  }

  scheduling_policy {
    preemptible = var.nat_vm_preemptible
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.public.id
    ip_address = var.nat_instance_ip
    nat        = true
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_key}"
  }
}

### Public-VM

resource "yandex_compute_instance" "public" {
  name     = "public-vm"
  hostname = "public-vm"
  zone     = var.default_zone

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_disk.size
      type     = var.vm_disk.type
    }
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_key}"
  }
}

### Private-VM

resource "yandex_compute_instance" "private" {
  name     = "private-vm"
  hostname = "private-vm"
  zone     = var.default_zone

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_disk.size
      type     = var.vm_disk.type
    }
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_key}"
  }
}
