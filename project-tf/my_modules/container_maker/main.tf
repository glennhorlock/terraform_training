/* Understanding Modules
   my_modules/container_maker/main.tf - the child module contains the work we want to actually do. Think of it like you might a function in other coding languages. In Ansible, it is not too unlike a "role" */


# modules should have a provider mapped inside of them, for more on this see the following posts
### https://discuss.hashicorp.com/t/why-doesnt-required-providers-in-a-child-module-inherit-declarations-from-the-parent/41493/2
### https://stackoverflow.com/questions/75457176/terraform-child-module-does-not-inherit-provider-from-root-module

terraform {
  required_providers {   # without the required providers inside of the module, the root module may have problems when calling the module
    docker = {
      source  = "kreuzwerker/docker"
      # version = "2.22.1"   # Do not use ~> (or other maximum-version constraints) for modules you intend to reuse across many configurations...  Specify a minimum version.. let the root module manage the maximum version.
    }
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:1.23.4"      # within the child module we can make a decision regarding values we have mapped. Perhaps we want to statically map the image name and tag, as opposed to allowing the user to map it with a variable
  keep_locally = true                # keep image after "destroy"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name          # mapped in "my_modules/container_maker/variables.tf", but we can override those values when we call the module from "main.tf"
  ports {
    internal = 80
    external = var.external_port      # mapped in "my_modules/container_maker/variables.tf", but we can override those values when we call the module from "main.tf"
  }
}
