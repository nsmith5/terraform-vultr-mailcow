terraform {
  required_providers {
    vultr = {
      version = ">= 1.5.0"
      source  = "vultr/vultr"
    }
    ct = {
      source  = "poseidon/ct"
      version = "0.7.0"
    }
  }
}
