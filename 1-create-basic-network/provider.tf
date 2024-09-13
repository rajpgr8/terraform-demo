terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = ">= 3.33"
        }
    }
}

provider "google" {
    access_token = var.access_token
    project      = var.project_id
}
