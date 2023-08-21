variable "hcloud_token" {
  default = "6ki3eOHKgjY3a8g6Ak7u413DuY3EHZdToK8vEJRMxxmcUSxk7inxZbl0sUxlU6Jv"
}

variable "location" {
  type        = string
  default     = "ash"
}

variable "firewall_name" {
  type        = string
  default     = "tic-firewall"
}

variable "labels" {
  type        = map(string)

  default = {
    ENV = "dev-tic"
  }
}

variable "primary_ip_name" {
  type        = string
  default     = "tic_primary_ip"
}

variable "primary_ip_type" {
  type        = string
  default     = "ipv4"
}

variable "datacenter" {
  type        = string
  default     = "ash-dc1"
}

variable "primary_ip_assignee_type" {
  type        = string
  default     = "server"
}

variable "server_name" {
   type        = string
   default = "tic-server"
 }

 variable "server_image" {
   type        = string
   default = "docker-ce"
 }

 variable "server_type" {
   type        = string
   default     = "cpx21"
 }

 variable "server_backup" {
   type        = bool
   default     = "true"
 }

 variable "server_volume" {
   type        = string
   default = "server-volume1"
 }

 variable "server_volume_size" {
   type        = string
   default = "10"
 }

 variable "server_volume_format" {
   type        = string
   default = "ext4"
 }

 variable "ssh_keys" {
  type        = list(string)
  default     = []
  description = "SSH key IDs or names which should be injected into the server at creation time"
}

variable "network_name" {
  type        = string
  default = "tic_network"
}
