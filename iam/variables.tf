variable "project_name" {
  type        = string
  description = "GCP Project"
  default     = "st-infra-development"
}

variable "region" {
  type    = string
  default = "asia-southeast1"
}

variable "zone" {
  type    = string
  default = "asia-southeast1-a"
}