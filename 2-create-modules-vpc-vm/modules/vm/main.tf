resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  zone         = var.instance_zone
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  tags = var.instance_tags 
  network_interface {
    network = var.network
    subnetwork = var.subnetwork

    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
  metadata_startup_script = "apt-get update && apt-get install nginx -y && service nginx restart > /test.txt"
}