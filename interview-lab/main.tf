module "europe-west1-c" {
  source = "./modules/multi-region"

  zone = "europe-west1-c"
}

module "europe-west1-d" {
  source = "./modules/multi-region"

  zone = "europe-west1-d"
}
