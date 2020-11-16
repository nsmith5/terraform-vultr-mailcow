data "template_file" "fcct" {
  template = file("${path.module}/fcct.yaml")
  vars = {
    base64_conf = base64encode(var.conf)
    ssh_key     = var.ssh_key
  }
}

data "ct_config" "fcct" {
  content      = data.template_file.fcct.rendered
  strict       = true
  pretty_print = false
}

resource "vultr_server" "mailcow" {
  os_id     = "391" # Fedora CoreOS
  user_data = data.ct_config.fcct.rendered

  region_id              = var.region_id
  plan_id                = var.plan_id
  firewall_group_id      = var.firewall_group_id
  network_ids            = var.network_ids
  auto_backup            = var.auto_backup
  enable_ipv6            = var.enable_ipv6
  enable_private_network = var.enable_private_network
  notify_activate        = var.notify_activate
  ddos_protection        = var.ddos_protection
  hostname               = var.hostname
  tag                    = var.tag
  label                  = var.label
  reserved_ip            = var.reserved_ip
}
