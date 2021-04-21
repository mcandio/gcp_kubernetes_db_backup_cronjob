data "google_secret_manager_secret_version" "db_name" {
  secret = ""
  project = var.project
}

data "google_secret_manager_secret_version" "db_password" {
  secret = ""
  project = var.project
}

data "google_container_cluster" "infra" {
  name     = ""
  location = var.region
  project  = var.project
}