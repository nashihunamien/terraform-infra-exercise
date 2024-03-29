module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.2.0"

    project_id   = var.project_id
    network_name = var.vpc_name
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-compute"
            subnet_ip             = var.subnet_ip_compute
            subnet_region         = var.region
            subnet_private_access = "true"
            subnet_flow_logs      = "false"
            description           = "This subnet for compute"
        },
        {
            subnet_name           = "subnet-data"
            subnet_ip             = var.subnet_ip_data
            subnet_region         = var.region
            subnet_private_access = "true"
            subnet_flow_logs      = "false"
            description           = "This subnet for data"
        }
    ]

    secondary_ranges = {
        subnet-compute = [
            {
                range_name    = "kube-pod"
                ip_cidr_range = var.secondary_subnet_ip_pod
            },
            {
                range_name    = "kube-service"
                ip_cidr_range = var.secondary_subnet_ip_service
            }
        ]
    }

    routes = [
        {
            name                   = "egress-internet"
            description            = "route through IGW to access internet"
            destination_range      = "0.0.0.0/0"
            tags                   = "egress-inet"
            next_hop_internet      = "true"
        }
    ]
}

resource "google_service_networking_connection" "connection_network" {
  network                 = module.vpc.network_name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_service.name]
}