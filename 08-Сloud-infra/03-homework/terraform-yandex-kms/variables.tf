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
