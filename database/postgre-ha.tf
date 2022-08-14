module "pg" {
  source  = "GoogleCloudPlatform/sql-db/google//modules/postgresql"
  version = "~> 11.0.0"

  project_id = var.project_id
  region     = var.region

  # Master configurations
  name                            = var.pg_ha_name
  random_instance_name            = true
  database_version                = var.db_version
  tier                            = var.db_tier
  zone                            = var.zone
  availability_type               = var.availability_type
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  deletion_protection = false

  database_flags = [{ name = "autovacuum", value = "off" }]

  user_labels = {
    foo = "bar"
  }

  ip_configuration = {
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

  backup_configuration = {
    enabled                        = true
    start_time                     = "20:55"
    location                       = null
    point_in_time_recovery_enabled = false
    transaction_log_retention_days = null
    retained_backups               = 365
    retention_unit                 = "COUNT"
  }

  # Read replica configurations
  read_replica_name_suffix = "-test"
  read_replicas = [
    {
      name                  = "0"
      zone                  = var.zone
      availability_type     = var.availability_type
      tier                  = var.db_tier
      ip_configuration      = local.read_replica_ip_configuration
      database_flags        = [{ name = "autovacuum", value = "off" }]
      disk_autoresize       = null
      disk_autoresize_limit = null
      disk_size             = null
      disk_type             = "PD_HDD"
      user_labels           = { bar = "baz" }
      encryption_key_name   = null
    },
    {
      name                  = "1"
      zone                  = var.zone
      availability_type     = var.availability_type
      tier                  = var.db_tier
      ip_configuration      = local.read_replica_ip_configuration
      database_flags        = [{ name = "autovacuum", value = "off" }]
      disk_autoresize       = null
      disk_autoresize_limit = null
      disk_size             = null
      disk_type             = "PD_HDD"
      user_labels           = { bar = "baz" }
      encryption_key_name   = null
    },
    {
      name                  = "2"
      zone                  = var.zone
      availability_type     = var.availability_type
      tier                  = var.db_tier
      ip_configuration      = local.read_replica_ip_configuration
      database_flags        = [{ name = "autovacuum", value = "off" }]
      disk_autoresize       = null
      disk_autoresize_limit = null
      disk_size             = null
      disk_type             = "PD_HDD"
      user_labels           = { bar = "baz" }
      encryption_key_name   = null
    },
  ]

  db_name      = var.pg_ha_name
  db_charset   = "UTF8"
  db_collation = "en_US.UTF8"

  additional_databases = [
    {
      name      = "${var.pg_ha_name}-additional"
      charset   = "UTF8"
      collation = "en_US.UTF8"
    },
  ]

  user_name     = "tftest"
  user_password = "foobar"

  additional_users = [
    {
      name     = "tftest2"
      password = "abcdefg"
      host     = "localhost"
    },
    {
      name     = "tftest3"
      password = "abcdefg"
      host     = "localhost"
    },
  ]
}
