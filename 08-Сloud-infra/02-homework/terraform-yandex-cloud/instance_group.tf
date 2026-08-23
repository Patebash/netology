resource "yandex_compute_instance_group" "web" {
  name               = "web-instance-group"
  service_account_id = data.yandex_iam_service_account.terraform.id

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 1
  }

  health_check {
    interval            = 10
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3

    http_options {
      port = 80
      path = "/"
    }
  }

  instance_template {
    platform_id = "standard-v1"

    resources {
      cores         = var.vm_resources.cores
      memory        = var.vm_resources.memory
      core_fraction = var.vm_resources.core_fraction
    }

    boot_disk {
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size     = var.vm_disk.size
        type     = var.vm_disk.type
      }
    }

    network_interface {
      network_id = yandex_vpc_network.network.id
      subnet_ids = [yandex_vpc_subnet.public.id]
      nat        = true
    }

    scheduling_policy {
      preemptible = var.vm_preemptible
    }

    metadata = {
      user-data = <<-EOF
        #cloud-config
        write_files:
          - path: /var/www/html/index.html
            content: |
              <!DOCTYPE html>
              <html>
              <head>
                <meta charset="UTF-8">
                <title>Yandex Cloud</title>
              </head>
              <body>
                <h1>Web server</h1>
                <p>Instance Group работает!</p>
                <img src="https://storage.yandexcloud.net/pat-yc-images/images.jpeg" alt="Image">
              </body>
              </html>
      EOF
    }
  }

  scale_policy {
    fixed_scale {
      size = var.instance_group_size
    }
  }
}
