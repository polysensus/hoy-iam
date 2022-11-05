terraform {
  required_version = "~> 1.3.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.7.1"
    }
  }
  backend "remote" {
    organization = "polysensus"
    workspaces {
      name = "hoy-iam-dev"
    }
  }
}
