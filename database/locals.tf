locals {
  read_replica_ip_configuration = {
    ipv4_enabled       = true
    require_ssl        = true
    private_network    = data.google_compute_subnetwork.subnet.network
    allocated_ip_range = data.google_compute_subnetwork.subnet.ip_cidr_range
    authorized_networks = [
      {
        name  = "${var.project_id}-cidr"
        value = data.google_compute_subnetwork.subnet.network
      },
    ]
  }
}
