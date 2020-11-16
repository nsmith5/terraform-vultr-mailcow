provider "vultr" {
}

module "mailcow" {
  source    = "./../.."
  conf      = file("mailcow.conf")
  ssh_key   = var.ssh_key
  region_id = "4"
  plan_id   = "401"
}
