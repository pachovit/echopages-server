terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.48.0"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a server
resource "hcloud_server" "node1" {
  name        = "echopages-server"
  image       = "ubuntu-24.04"
  location    = var.server_location
  server_type = "cx22"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  user_data = templatefile("${path.module}/cloud-init.yaml", {
    ssh_public_key = var.ssh_public_key
    user           = var.main_user
  })
}

# Create a volume
resource "hcloud_volume" "storage" {
  name       = "echopages-volume"
  size       = 15
  server_id  = hcloud_server.node1.id
  automount  = true
  format     = "ext4"
  lifecycle {
    prevent_destroy = true # Disallow volume deleted with `terraform destroy`
  }
}