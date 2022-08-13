module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 3.0.0"

  name    = "${var.env}-router"
  project = var.project_id
  region  = var.region
  network = module.vpc.network_name

  nats = [
    {
      name                                = "${var.env}-nat"
      nat_ip_allocate_option              = "MANUAL_ONLY"
      source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
      nat_ips                             = [google_compute_address.nat.self_link]
    }
  ]
}