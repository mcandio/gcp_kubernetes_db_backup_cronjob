variable "cron_name" {
  type        = string
  description = "The name of the cron to be read in the kubernetes cluster"
}

variable "schedule" {
  type        = string
  description = "The time when the cron must run."
}

variable "image" {
  type        = string
  description = "Name of the image to use in the object."
  default     = "gcr.io/properati-infra/infra-utils:latest"
}

variable "command" {
  type        = any
  description = "Command to execute in the container"
}

variable "serviceaccount" {
  type = string
}

variable "namespace" {
  type = string 
}

variable "concurrency_policy" {
  default = "Forbid"
  type    = string
  description = "The type of job creation, allow, forbid, replace."
}

variable "starting_deadline_seconds" {
  default = "10"
  type    = string
  description = "Deadline in seconds for starting the job if it misses scheduled time for any reason."
}

variable "successful_jobs_history_limit" {
  default = "10"
  type    = string
  description = "The number of successful finished jobs to retain."
}

variable "variables" {
  type = any
  description = "The environment variables that you need inside the container."
}

variable "env_secret_name" {
  type = any
  description = "The secret where there's env vars to put inside the container"
}

variable "parallelism" {
  type = number
  description = "Specifies the maximum desired number of pods the job should run at any given time."
  
}