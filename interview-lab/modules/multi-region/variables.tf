variable "project" {
  default = "dh-ce-dev-media-59188"
}
variable "region" {
  default = "europe-west1"
}
variable "zone" {}
variable "name" {
  default = "nginx-app-vm"
}
variable "network" {
  default = "emom-mlt-base-network"
}
variable "subnet" {
  default = "dev-cmp-rdg-subnet"
}
variable "tags" {
  type    = list(any)
  default = ["nginx-app", "nginx"]
}
variable "machine_type" {
  default = "e2-medium"
}
variable "instance_description" {
  default = "nginx-app server template"
}
variable "instance_template_description" {
  default = "This template is used to create nginx-app server instances"
}
