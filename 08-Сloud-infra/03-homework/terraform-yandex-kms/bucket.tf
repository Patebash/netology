resource "yandex_storage_bucket" "images" {
  bucket = "pat-yc-images"

  anonymous_access_flags {
    read = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "image" {
  bucket       = yandex_storage_bucket.images.bucket
  key          = "images.jpeg"
  source       = "${path.module}/files/images.jpeg"
  content_type = "image/jpeg"
}
