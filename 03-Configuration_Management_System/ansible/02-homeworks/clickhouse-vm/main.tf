resource "yandex_compute_instance" "db-1" {
  name = "clickhouse-vm1"
  zone = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8cg1dm2age73ho5std"
      size     = 10
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id = "e2l4mgn7a8jdsnbbqmc8"
    nat       = true
  }

  scheduling_policy {
    preemptible = true
  }

  metadata = {
    ssh-keys           = "centos:${file("~/.ssh/id_rsa.pub")}"
  }

}
