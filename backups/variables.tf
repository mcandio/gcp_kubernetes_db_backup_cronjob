variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "namespace_app" {
  type = string
}

variable "env_vars" {
  type = any
  description = "The environment variables that you need inside the container."
}

variable "context" {
  type = string
  description = "The name of the Kubernetes context to use."
  
}