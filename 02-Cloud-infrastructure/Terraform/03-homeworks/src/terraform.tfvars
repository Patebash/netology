vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 20
    hdd_size      = 10
    hdd_type      = "network-hdd"
  }
}

each_vm = [
  {
    vm_name       = "main"
    cpu           = 2
    ram           = 2
    core_fraction = 20
    disk_volume   = 10
  },
  {
    vm_name       = "replica"
    cpu           = 2
    ram           = 1
    core_fraction = 20
    disk_volume   = 10
  }
]
