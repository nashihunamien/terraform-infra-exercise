module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster/"
  project_id                 = var.project_id
  name                       = var.gke_cluster_name
  region                     = var.region
  zones                      = [var.zone]
  
  # network configuration
  network                    = data.google_compute_network.vpc.name
  subnetwork                 = data.google_compute_subnetwork.subnet.name
  ip_range_pods              = data.google_compute_subnetwork.subnet.secondary_ip_range[0].range_name
  ip_range_services          = data.google_compute_subnetwork.subnet.secondary_ip_range[1].range_name
  
  # gke configuration
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  enable_private_nodes       = true
  remove_default_node_pool   = false # set to 'true' for not using default node pool
  create_service_account     = false
  service_account            = "default"

  # UTC
  # Start at 1 AM - 5 AM (4 hours window by default) GMT +7
  maintenance_start_time = "18:00"

  # node pool configuration
  node_pools = [
    {
      name                      = "default-node-pool"
      machine_type              = "e2-medium"
      initial_node_count        = 1
      min_count                 = 1
      max_count                 = 3
      local_ssd_count           = 0
      spot                      = false
      disk_size_gb              = 100
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = true
      auto_scaling              = true
      preemptible               = true
    },
  ]

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}