resource "google_service_account" "backup_account" {
  account_id   = "backups-sa"
  display_name = "Service account to store the backups in bucket"
  project      = var.project
}