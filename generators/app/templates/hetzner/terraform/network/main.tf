############################### SSH KEY #################################
resource "hcloud_ssh_key" "default" {
  name       = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

################################ NETWORK #################################

resource "hcloud_network" "network" {
  name     = var.network_name
  ip_range = var.network_ip_range

  depends_on = [
    hcloud_ssh_key.default
  ]
}

resource "hcloud_network_subnet" "network_subnet" {
  type         = var.network_subnet_type
  network_id   = hcloud_network.network.id
  network_zone = var.network_zone
  ip_range     = var.subnet_ip_range

  depends_on = [
    hcloud_network.network
  ]
}

resource "hcloud_network_route" "network_route" {
  network_id  = hcloud_network.network.id
  destination = var.route_destination
  gateway     = var.route_gateway

  depends_on = [
    hcloud_network_subnet.network_subnet
  ]

}
  
