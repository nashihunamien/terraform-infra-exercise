variable "project_id" {
  type        = string
  description = "GCP Project"
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
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

variable "availability_type" {
  type        = string
  description = "availability of the database"
}

variable "pg_ha_name" {
  type        = string
  description = "name of the database ha"
}

variable "db_version" {
  type        = string
  description = "version of the database"
}

variable "db_tier" {
  type        = string
  description = "tier of the database"
}
