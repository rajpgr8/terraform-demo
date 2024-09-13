# Create a VPC, subnet 
module "vpc" {
	source          = "./modules/vpc/"
	vpc_name        = var.vpc_name
	subnet_name     = var.subnet_name
  region          = var.region
  ip_cidr_range   = var.ip_cidr_range
}

# Create a firewall rule to allow http, ssh, rdp and icmp from internet
resource "google_compute_firewall" "demonet_allow_http_ssh_rdp_icmp" {
  name    = "demonet-allow-http-ssh-rdp-icmp"
  source_ranges = [
    "0.0.0.0/0"
  ]
  network = var.vpc_name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }

  allow {
    protocol = "icmp"
  }
  depends_on = [ module.vpc]
}

# Create a VM
module "vm" {
	source = "./modules/vm/"
	instance_name = var.instance_name
	instance_zone = var.instance_zone
	instance_type = var.instance_type
	instance_tags = var.instance_tags
	network = var.vpc_name
	subnetwork = var.subnet_name
  depends_on = [ module.vpc, google_compute_firewall.demonet_allow_http_ssh_rdp_icmp]
}
