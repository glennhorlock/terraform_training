terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {}


resource "docker_image" "acme" {
        name         = "nginx:1.23.4"    # if you use the tag "latest" it will bark
        keep_locally = true
}

resource "docker_container" "acme" {
        name  = "tf-test"
        image = "${docker_image.acme.image_id}"

        # visit https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
        # note that "upload" is a "block set" (the block is "upload" and the "set" are unique "upload" blocks)

        # dynamic "upload" block (this is the type of block we want to repeat over)
          dynamic "upload" {
            for_each = var.upload_content      # this is the variable we wish to loop over
            iterator = item                    # optional. If we do NOT include it, the name of the block ("upload") would be used
            content {
                content        = item.value.content
                file           = item.value.file
                executable     = item.value.executable
                }
            }
}


# we may provide values for this definition in a tfvars file
# the types are found at https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
variable "upload_content" {
  description = "list of file data to upload into containers"
  type = list(object({
    content                  = string
    file                     = string
    executable               = bool
  }))
}

