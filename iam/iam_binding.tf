resource "google_project_iam_binding" "project_owner" {
    project = var.project_name
    role = "roles/owner"
    members = []
}

resource "google_project_iam_binding" "project_reader" {
    project = var.project_name
    role = "roles/owner"
    members = []
}