# Vultr Mailcow Terraform module

[![Build Status][build-badge]][build-link]

[build-badge]: https://cloud.drone.io/api/badges/nsmith5/terraform-vultr-mailcow/status.svg
[build-link]: https://cloud.drone.io/nsmith5/terraform-vultr-mailcow

Terraform module that creates an Vultr instance running [Mailcow][mailcow] on
[Fedora CoreOS][fcos].

[mailcow]: https://mailcow.email/
[fcos]: https://docs.fedoraproject.org/en-US/fedora-coreos/

## Installation

Module usage is basically the same as `vultr_server`, with a few differences:

- a `conf` variables accepts your Mailcow config
- SSH key is accepted using `ssh_key` instead of the usual `ssh_key_ids` as
  CoreOS does not work with the usual method of adding SSH keys to Vultr
servers
- `os_id` isn't configurable because we use Fedora CoreOS

```terraform
provider "vultr" {
}

module "mailcow" {
  source    = "./../.."
  conf      = file("mailcow.conf")
  ssh_key   = var.ssh_key 
  
  region_id = "4"    # Seattle
  plan_id   = "401"  # 1CPU + 2GB RAM + 64GB NVMe drive
}

resource "vultr_reverse_ipv4" "ptr_record" {
  instance_id = module.mailcow.server.id    # NB: vultr_server attributes available as '.server'
  ip          = module.mailcow.server.main_ip
  reverse     = "mail.example.com"
}
```

## Operation

The mailcow server can be accessed using SSH. You'll need the SSH key you
provided in the `ssh_key` variable and the IP address assigned to the server
(`module.mailcow.server.main_ip`).

```
$ ssh core@{server-ip-address}
```

You're configuration is available at `/opt/mailcow-dockerized`. It may take a
minute to become available. If in doubt, run `systemctl status
clone-mailcow.service` to check the status of config set up.

Mailcow is running as the systemd `mailcow`. You can check its status with
`systemctl status mailcow.service` and get logs with `journalctl -u mailcow`.
