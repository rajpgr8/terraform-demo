resource google_compute_network "demonet" {
    name = var.vpc_name
    auto_create_subnetworks = "false"
}

resource google_compute_subnetwork "demosubnet-us" {
    name = var.subnet_name
    region = var.region
    network = google_compute_network.demonet.self_link  //self_link is a unique URI.
    ip_cidr_range = var.ip_cidr_range
    private_ip_google_access = true
}

