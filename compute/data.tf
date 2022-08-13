data "google_compute_network" "vpc" {
  name    = var.vpc_name
  project = var.project_id
}

data "google_compute_subnetwork" "subnet" {
  name    = var.subnet_name
  project = var.project_id
  region  = var.region
}

data "google_compute_address" "nat_gateway" {
  name    = "${var.env}-nat"
  project = var.project_id
  region  = var.region
}