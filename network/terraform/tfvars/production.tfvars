env = "production"
project_id = "" # change to your personal project id
region = "us-central1"
zone = "us-central1-c"
vpc_name = "production-vpc"
vpc_cidr = "10.30.0.0/16"
subnet_ip_compute = "10.30.0.0/20"
subnet_ip_data = "10.30.16.0/20"
secondary_subnet_ip_pod = "172.30.0.0/20"
secondary_subnet_ip_service = "172.30.100.0/22"
ip_google_private_ip_service = "172.19.64.0"