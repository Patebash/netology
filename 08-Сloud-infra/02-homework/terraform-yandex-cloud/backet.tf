resource "yandex_storage_bucket" "images" {
  bucket = "pat-yc-images"

  anonymous_access_flags {
    read = true
  }
}

resource "yandex_storage_object" "image" {
  bucket       = yandex_storage_bucket.images.bucket
  key          = "images.jpeg"
  source       = "${path.module}/files/images.jpeg"
  content_type = "image/jpeg"
}
