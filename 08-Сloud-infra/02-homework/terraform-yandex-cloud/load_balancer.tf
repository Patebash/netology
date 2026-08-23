resource "yandex_lb_target_group" "web" {
  name = "web-target-group"

  dynamic "target" {
    for_each = yandex_compute_instance_group.web.instances

    content {
      subnet_id = target.value.network_interface[0].subnet_id
      address   = target.value.network_interface[0].ip_address
    }
  }
}

resource "yandex_lb_network_load_balancer" "web" {
  name = "web-load-balancer"

  listener {
    name = "http"
    port = 80

    protocol = "tcp"

    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.web.id

    healthcheck {
      name = "http-health-check"

      http_options {
        port = 80
        path = "/"
      }

      interval = 10
      timeout  = 5

      healthy_threshold   = 2
      unhealthy_threshold = 3
    }
  }
}
