locals {
  vm_db_fqdn  = "${var.vm_db_name}-${var.vm_db_subnet_zone}"
  vm_web_fqdn = "${var.vm_web_name}-${var.default_zone}"
}
