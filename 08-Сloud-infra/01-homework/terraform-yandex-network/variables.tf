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

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block of the private subnet"
}

variable "nat_instance_ip" {
  type        = string
  description = "Internal IP address of the NAT instance"
}


### NAT instance vars

variable "nat_vm_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })

  description = "NAT instance compute resources"
}

variable "nat_vm_disk" {
  type = object({
    size = number
    type = string
  })

  description = "NAT instance boot disk parameters"
}

variable "nat_vm_preemptible" {
  type        = bool
  description = "Use preemptible VM for NAT instance"
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
