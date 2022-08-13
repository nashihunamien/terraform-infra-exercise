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

variable "vpc_name" {
  type = string
  description = "name of the vpc network"
}

variable "subnet_name" {
  type = string
  description = "name of the vpc network"
}

variable "gke_cluster_name" {
  type = string
  description = "name of the gke cluster"
}