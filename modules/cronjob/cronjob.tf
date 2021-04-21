resource "kubernetes_cron_job" "backup" {
  metadata {
    name = var.cron_name
    namespace = var.namespace
  }
  spec {

    concurrency_policy            = var.concurrency_policy
    failed_jobs_history_limit     = 5
    schedule                      = var.schedule
    starting_deadline_seconds     = var.starting_deadline_seconds
    successful_jobs_history_limit = var.successful_jobs_history_limit
    job_template {
      metadata {}
      spec {
        parallelism                = var.parallelism
        backoff_limit              = 0
        ttl_seconds_after_finished = 10
        template {
          metadata {}

          spec {
            service_account_name   = var.serviceaccount
            container {
              name    = var.cron_name
              image   = var.image
              image_pull_policy = "IfNotPresent"
              command = var.command
              env_from {
                secret_ref {
                  name  = var.env_secret_name
                } 
              }
              #This is an env loop if your envs aren't sensitive etc.
                dynamic "env" {
                      for_each  = var.variables

                      content {
                         name  = env.value.name
                         value = env.value.value
                } 
              }
            }
          }
        }
      }
    }
  }
}