terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.15.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.33.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "/etc/rancher/k3s/k3s.yaml"
  }
}

provider "kubernetes" {
  config_path = "/etc/rancher/k3s/k3s.yaml"
}
