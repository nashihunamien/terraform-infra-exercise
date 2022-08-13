# module "dns-private-zone" {
#   source  = "terraform-google-modules/cloud-dns/google"
#   version = "~> 4.1.0"
#   project_id = var.project_id
#   type       = "private"
#   name       = "${var.env}-domain-internal"
#   domain     = "${var.env}.internal."

#   private_visibility_config_networks = [
#     module.vpc.network_self_link
#   ]

#   recordsets = [
#     {
#       name    = "localhost"
#       type    = "A"
#       ttl     = 300
#       records = [
#         "127.0.0.1",
#       ]
#     },
#   ]
# }