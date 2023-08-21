data "hcloud_network" "network" {
  name = var.network_name
}

data "hcloud_ssh_key" "default" {
  name = "ssh_key"
}
######################### FIREWALL #################################

resource "hcloud_firewall" "myfirewall" {
  name = var.firewall_name
  rule {
    direction = "in"
    protocol  = "icmp"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8080"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "3001"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

######################### PRIMARY IP #################################

resource "hcloud_primary_ip" "primary_ip_1" {
name          = var.primary_ip_name
type          = var.primary_ip_type
datacenter    = var.datacenter
assignee_type = var.primary_ip_assignee_type
auto_delete   = false
labels      = var.labels

depends_on = [
    hcloud_firewall.myfirewall
  ]
}

######################### CLOUD SERVER #################################

resource "hcloud_server" "server" {
  name        = var.server_name
  image       = var.server_image
  datacenter  = var.datacenter
  server_type = var.server_type
  labels      = var.labels
  ssh_keys    = [data.hcloud_ssh_key.default.id]

  public_net {
    ipv4_enabled = true
    ipv4 = hcloud_primary_ip.primary_ip_1.id
    ipv6_enabled = true
  }

  depends_on = [
    hcloud_primary_ip.primary_ip_1
  ]
}

##########################VOLUME FOR SERVER ########################################

resource "hcloud_volume" "server_volume" {
  name      = var.server_volume
  size      = var.server_volume_size
  server_id = hcloud_server.server.id
  automount = true
  format    = var.server_volume_format

  depends_on = [
    hcloud_server.server
  ]
}

######################### NETWORK ATTACHMENT TO SERVER #################################

resource "hcloud_server_network" "srvnetwork" {
  server_id  = hcloud_server.server.id
  network_id = data.hcloud_network.network.id
  ip         = "10.0.1.5"

  depends_on = [
    hcloud_server.server
  ]
}

######################### FIREWALL ATTACHMENT TO SERVER #################################

resource "hcloud_firewall_attachment" "fw_server_att" {
    firewall_id = hcloud_firewall.myfirewall.id
    server_ids  = [hcloud_server.server.id]
}