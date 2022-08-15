module "redis" {
  source  = "terraform-google-modules/memorystore/google"
  version = "3.0.0"

  project       = var.project_id
  region        = var.region
  name          = "redis"
  display_name  = "redis"
  tier          = "BASIC"


  redis_version       = "REDIS_4_0"
  authorized_network  = data.google_compute_network.vpc.name
  connect_mode        = "PRIVATE_SERVICE_ACCESS"
  auth_enabled        = true
  memory_size_gb      = 1
}
