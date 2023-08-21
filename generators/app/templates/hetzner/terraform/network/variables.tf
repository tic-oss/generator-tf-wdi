variable "hcloud_token" {
  default = "6ki3eOHKgjY3a8g6Ak7u413DuY3EHZdToK8vEJRMxxmcUSxk7inxZbl0sUxlU6Jv"
}

variable "network_name" {
  type        = string
  default = "tic_network"
}

variable "network_ip_range" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "network_subnet_type" {
  type        = string
  default     = "cloud"
}

variable "network_zone" {
  type        = string
  default     = "us-east"
}

variable "subnet_ip_range" {
  type        = string
  default = "10.0.1.0/24"
}

variable "route_destination" {
  type        = string
  default     = "10.100.1.0/24"
}

variable "route_gateway" {
  type        = string
  default     = "10.0.1.1"
}

variable "location" {
  type        = string
  default     = "ash"
}

variable "labels" {
  type        = map(string)

  default = {
    ENV = "dev-tic"
  }
}

