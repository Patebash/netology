### Cloud vars

variable "service_account_key_file" {
  description = "Path to service account JSON key"
  type        = string
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "default_zone" {
  type        = string
  description = "Default availability zone"
}

### Network vars

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block of the public subnet"
}

### VM instance vars

variable "vm_image_family" {
  type        = string
  description = "Image family for regular virtual machines"
}

variable "vm_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })

  description = "Compute resources for regular virtual machines"
}

variable "vm_disk" {
  type = object({
    size = number
    type = string
  })

  description = "Boot disk parameters for regular virtual machines"
}

variable "vm_preemptible" {
  type        = bool
  description = "Use preemptible regular virtual machines"
}

### Instance group VMs vars

variable "instance_group_size" {
  description = "Number of VMs in the instance group"
  type        = number
  default     = 3
}
