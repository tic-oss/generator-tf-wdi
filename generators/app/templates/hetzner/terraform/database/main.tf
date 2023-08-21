data "hcloud_network" "network" {
  name = var.network_name
}

data "hcloud_ssh_key" "default" {
  name = "ssh_key"
}

data "hcloud_primary_ip" "primary_ip_1"{
  name = var.primary_ip_name
}
################# FIREWALL ####################################################

resource "hcloud_firewall" "database_myfirewall" {
  name = var.database_firewall_name
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "27017"
    source_ips =["${data.hcloud_primary_ip.primary_ip_1.ip_address}/32"]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "3306"
    source_ips = ["${data.hcloud_primary_ip.primary_ip_1.ip_address}/32"]
  }

}

######################### DATABASE PRIMARY IP #################################

resource "hcloud_primary_ip" "database_primary_ip_1" {
name          = var.database_primary_ip_name
type          = var.primary_ip_type
datacenter    = var.datacenter
assignee_type = var.primary_ip_assignee_type
auto_delete   = false
labels      = var.labels

depends_on = [
    hcloud_firewall.database_myfirewall
  ]
}

######################### CLOUD SERVER #################################

resource "hcloud_server" "database_server" {
  name        = var.database_server_name
  image       = var.server_image
  datacenter  = var.datacenter
  server_type = var.database_server_type
  labels      = var.labels
  ssh_keys    = [data.hcloud_ssh_key.default.id]

  public_net {
    ipv4_enabled = true
    ipv4 = hcloud_primary_ip.database_primary_ip_1.id
    ipv6_enabled = true
  }

  depends_on = [
    hcloud_primary_ip.database_primary_ip_1
  ]
}

########################## VOLUME FOR DATABASE #######################################

resource "hcloud_volume" "db_server_volume" {
  name      = var.db_volume
  size      = var.db_volume_size
  server_id = hcloud_server.database_server.id
  automount = true
  format    = var.db_volume_format

  depends_on = [
    hcloud_server.database_server
  ]
}

######################### NETWORK ATTACHMENT TO SERVER #################################

resource "hcloud_server_network" "db_srv_network" {
  server_id  = hcloud_server.database_server.id
  network_id = data.hcloud_network.network.id
  ip         = "10.0.1.6"

  depends_on = [
    hcloud_server.database_server
  ]
}

######################### FIREWALL ATTACHMENT TO SERVER #################################

resource "hcloud_firewall_attachment" "fw_db_server_att" {
    firewall_id = hcloud_firewall.database_myfirewall.id
    server_ids  = [hcloud_server.database_server.id]

    depends_on = [
    hcloud_server.database_server
  ]
}
