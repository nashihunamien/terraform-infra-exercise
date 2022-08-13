resource "google_compute_address" "nat" {
  name          = "${var.env}-nat-gateway"
  network_tier  =  "PREMIUM"
}

resource "google_compute_address" "gke_loadbalancer" {
  name         = "${var.env}-gke-loadbalancer"
  network_tier = "PREMIUM"
}