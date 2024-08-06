/* main.tf
   Alta3 Research - rzfeeser@alta3.com */

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.7.2"
    }
  }
}

# interact with docker
provider "docker" {}

# create random_ resources
provider "random" {}

# interact with time data
provider "time" {}

resource "docker_image" "nginx" {
  name         = "nginx:1.23.4"
  keep_locally = true
}

# available from random.random_pet
resource "random_pet" "nginx" {
  length = 2
}

resource "docker_container" "nginx" {
  count = 4
  image = docker_image.nginx.image_id
  name  = "nginx-${random_pet.nginx.id}-${count.index}"
  # name = "nginx-hoppy-frog-0"

  ports {
    internal = 80
    # 8000, 8001, 8002, 8003
    external = 8000 + count.index
  }
}

## Output value definitions

output "nginx_hosts" {
  value = [for container in docker_container.nginx : { name : container.name, host : "${container.ports[0].ip}:${container.ports[0].external}" }]
}
