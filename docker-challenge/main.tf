terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "simplgoservice" {
  name         = "registry.gitlab.com/alta3/simplegoservice"
  keep_locally = true    // keep image after "destroy"
}

resource "docker_container" "simplgoservice" {
  image = docker_image.simplgoservice.image_id
  name  = "var.container_name"
  ports {
    internal = var.internal
    external = var.external
  }
}
