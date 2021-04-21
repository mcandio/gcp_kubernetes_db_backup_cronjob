provider "google" {
  region = var.region
}

provider "google-beta" {
  region = var.region
}

terraform {
  required_version = "~> 0.12.25"
  backend "gcs" {}
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = var.context
}