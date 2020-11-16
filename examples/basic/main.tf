provider "vultr" {
}

resource "vultr_ssh_key" "ssh_key" {
  name    = "mailcow_key"
  ssh_key = var.ssh_key
}

module "mailcow" {
  source    = "./../.."
  conf      = file("mailcow.conf")
  region_id = "4"
  plan_id   = "401"
}
