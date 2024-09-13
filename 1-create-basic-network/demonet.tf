resource google_compute_network "demonet" {
    name = "demonet"
    auto_create_subnetworks = "false"
}

resource google_compute_subnetwork "demosubnet-us" {
    name = "demosubnet-us"
    region = "us-central1"
    network = google_compute_network.demonet.self_link  //self_link is a unique URI.
    ip_cidr_range = "10.0.0.0/24"
    private_ip_google_access = true
}

resource "google_compute_firewall" "demonet_allow_http_ssh_rdp_icmp" {
  name    = "demonet-allow-http-ssh-rdp-icmp"
  source_ranges = [
    "0.0.0.0/0"
  ]
  network = google_compute_network.demonet.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }

  allow {
    protocol = "icmp"
  }
}

# Create a VM
module "vm" {
	source = "./modules/vm/"
	instance_name = var.instance_name
	instance_zone = var.instance_zone
	instance_type = var.instance_type
	instance_tags = var.instance_tags
	network = google_compute_network.demonet.self_link
	subnetwork = google_compute_subnetwork.demosubnet-us.self_link
}