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
  type        = string
  description = "VPC CIDR name."
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block to use."
}

variable "subnet_ip_compute" {
  type        = string
  description = "Subnet IP Block to use for compute."
}

variable "subnet_ip_data" {
  type        = string
  description = "Subnet IP Block to use for data."
}

variable "secondary_subnet_ip_pod" {
  type        = string
  description = "Subnet IP Block to use for kube pod."
}

variable "secondary_subnet_ip_service" {
  type        = string
  description = "Subnet IP Block to use for kube service."
}

variable "ip_google_private_ip_service" {
  type        = string
  description = "Subnet IP Block to use for Google private IP"
} 