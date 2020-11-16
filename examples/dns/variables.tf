variable "ssh_key" {
  description = "SSH Key for mailcow server"
  type        = string
}

variable "domain" {
  description = "Mail domain. If `example.com`, server will be at `mail.example.com`"
  default     = "example.com"
  type        = string
}
