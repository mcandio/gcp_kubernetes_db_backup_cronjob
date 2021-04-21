resource "google_storage_bucket" "gcp-backups" {
  project       = var.project
  name          = ""
  location      = "NAM4"
  force_destroy = false
  labels        = {
    "environment" = "infra" 
    "type"        = "backups"
    }

}

resource "google_storage_bucket_acl" "backups-store-acl" {
  bucket = google_storage_bucket.gcp-infra-backups.name

  role_entity = [
    "OWNER:user-${google_service_account.backup_account.email}",
  ]
}