resource "google_compute_global_address" "private_ip_service" {
  name          = "private-ip-service"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = "20"
  network       = module.vpc.network_name
  address       = var.ip_google_private_ip_service
}