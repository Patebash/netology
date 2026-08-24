resource "yandex_kms_symmetric_key" "bucket" {
  name              = "bucket-key"
  description       = "KMS key for Object Storage"
  default_algorithm = "AES_256"
  rotation_period   = "8760h"
}
