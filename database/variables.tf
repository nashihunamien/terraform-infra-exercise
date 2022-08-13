variable "project_id" {
  type        = string
  description = "GCP Project"
}

variable "region" {
  type    = string
}

variable "zone" {
  type    = string
}

variable "env" {
  type        = string
  description = "name of the environment"
}