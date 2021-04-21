module "backup" {
    source      = "../modules/cronjob" 
    
    namespace                     = var.namespace_app
    cron_name                     = "db-backup"
    schedule                      = "0 23 * * *"
    command                       = ["/bin/sh", "-c", "pg_dumpall -h $PSQLHOST -p 5432 -U postgres  -v -f /home/$DBNAME-$(date '+%d-%m-%Y-%H:%M:%S').sql && gsutil cp /home/*.sql gs://$GCS_BUCKET/backup/ "]  
    image                         = ""
    serviceaccount                = kubernetes_service_account.db-backup-sa.metadata.0.name
    concurrency_policy            = "Forbid"
    starting_deadline_seconds     = "10"
    successful_jobs_history_limit = "4"
    parallelism                   = 1
    variables                     = var.env_vars
    env_secret_name               = kubernetes_secret.environments.metadata.0.name
}

resource "kubernetes_service_account" "db-backup-sa" {
  metadata {
    name        = "db-backup"
    namespace   = var.namespace_app
    annotations = {
       "iam.gke.io/gcp-service-account" = google_service_account.backup_account.email
    }
  }
}

resource "kubernetes_secret" "environments" {
  metadata {
    name            = "db-backup-secret"
    namespace       = var.namespace_app
  } 

  data = {
    PGPASSWORD   = data.google_secret_manager_secret_version.db_password.secret_data
    DBNAME       = data.google_secret_manager_secret_version.db_name.secret_data
    PSQLHOST     = ""
    GCS_BUCKET   = ""
    PROJECT_NAME = var.project
  }

  
}
