data "vultr_os" "fcos" {
  filter {
    name = "name"
    values = ["Fedora CoreOS"]
  }
}

resource "vultr_server" "example" {
    plan_id = "201"
    region_id = "6"
    os_id = "167"
}
