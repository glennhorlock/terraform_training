/* Understanding Modules
   my_modules/container_maker/variables.tf - Don't overthink how to put together a child module, just create "normal" terraform solution. Here, we just map the variables that were mentioned in
                                             the file my_modules/container_maker/main.tf  */

# used in "my_modules/container_maker/main.tf" and may be remapped in the root "main.tf"
variable "container_name" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}

# used in "my_modules/container_maker/main.tf" and may be remapped in the root "main.tf"
variable "external_port" {
  description = "External port on the container"
  type        = number
  default     = 2224
}
