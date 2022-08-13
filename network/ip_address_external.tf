resource "google_compute_address" "nat" {
  name          = "${var.env}-nat-gateway"
  network_tier  =  "PREMIUM"
}