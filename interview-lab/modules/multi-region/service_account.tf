resource "google_service_account" "sa" {
  account_id   = "nginx-app-sa-id"
  display_name = "Nginx Service Account"
}
