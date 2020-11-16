variable "conf" {
  description = "Mailcow configuration file (i.e. mailcow.conf)"
  type        = string
}

variable "region_id" {
  description = "(Required) The ID of the region that the server is to be created in"
  type        = string
}

variable "plan_id" {
  description = "(Required) The ID of the plan that you want the server to subscribe to."
  type        = string
}

variable "firewall_group_id" {
  description = "(Optional) The ID of the firewall group to assign to the server."
  type        = string
  default     = ""
}

variable "network_ids" {
  description = "(Optional) A list of private network IDs to be attached to the server."
  type        = list(string)
  default     = []
}

variable "ssh_key_ids" {
  description = "(Optional) A list of SSH key IDs to apply to the server on install (only valid for Linux/FreeBSD)."
  type        = list(string)
  default     = []
}

variable "auto_backup" {
  description = "(Optional) Whether automatic backups will be enabled for this server (these have an extra charge associated with them)."
  type        = bool
  default     = false
}

variable "enable_ipv6" {
  description = "(Optional) Whether the server has IPv6 networking activated."
  type        = bool
  default     = false
}

variable "enable_private_network" {
  description = "(Optional) Whether the server has private networking support enabled."
  type        = bool
  default     = false
}

variable "notify_activate" {
  description = "(Optional) Whether an activation email will be sent when the server is ready."
  type        = bool
  default     = false
}

variable "ddos_protection" {
  description = "(Optional) Whether DDOS protection will be enabled on the server (there is an additional charge for this)."
  type        = bool
  default     = false
}

variable "hostname" {
  description = "(Optional) The hostname to assign to the server."
  type        = string
  default     = ""
}

variable "tag" {
  description = "(Optional) The tag to assign to the server."
  type        = string
  default     = ""
}

variable "label" {
  description = "(Optional) A label for the server."
  type        = string
  default     = ""
}

variable "reserved_ip" {
  description = "(Optional) IP address of the floating IP to use as the main IP of this server."
  type        = string
  default     = ""
}
