###cloud vars
variable "token" {
  description = "Service account JSON key"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

variable "vm_web_name" {
  type    = string
  default = "netology-develop-platform-web"
}

variable "vm_db_name" {
  type    = string
  default = "netology-develop-platform-db"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v1"
}


variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2404-lts"
}

variable "vms_resources" {
  description = "Resources configuration for all VMs"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
}

variable "each_vm" {
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    core_fraction = number
    disk_volume   = number
  }))
}

variable "vm_web_nat" {
  type    = bool
  default = true
}
