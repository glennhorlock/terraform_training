# variables.tf - with validations
variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
  
  validation {
     condition     = length(var.container_name) > 8 && substr(var.container_name, 0, 7) == "Example"
     error_message = "The container_name must begin with Example"
  } 
}

variable "internal" {
  description = "Internal port of the container"
  type        = number
  default     = 80
}

variable "external" {
  description = "External port on the container"
  type        = number
  default     = 2224
}

