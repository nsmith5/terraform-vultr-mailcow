provider "vultr" {
}

resource "vultr_dns_domain" "domain" {
  domain = var.domain
}

resource "vultr_dns_record" "A" {
  domain = vultr_dns_domain.domain.id
  name   = "mail"
  data   = module.mailcow.server.main_ip
  type   = "A"
}

resource "vultr_dns_record" "autodiscover" {
  domain = vultr_dns_domain.domain.id
  name   = "autodiscover"
  data   = "mail.${var.domain}"
  type   = "CNAME"
}

resource "vultr_dns_record" "autoconfig" {
  domain = vultr_dns_domain.domain.id
  name   = "autoconfig"
  data   = "mail.${var.domain}"
  type   = "CNAME"
}

resource "vultr_dns_record" "mx" {
  domain   = vultr_dns_domain.domain.id
  name     = ""
  data     = "mail.${var.domain}"
  type     = "MX"
  priority = "10" 
}

resource "vultr_reverse_ipv4" "ptr" {
  instance_id = module.mailcow.server.id
  ip          = module.mailcow.server.main_ip
  reverse     = "mail.${var.domain}"
}

module "mailcow" {
  source    = "./../.."
  conf      = file("mailcow.conf")
  ssh_key   = var.ssh_key 
  region_id = "4"
  plan_id   = "401"
  label     = "mail.${var.domain}"
  hostname  = "mail.${var.domain}"
}
