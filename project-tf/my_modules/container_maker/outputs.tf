/* Understanding Modules
   my_modules/container_maker/outputs.tf - These are the outputs we want from the module. They may be access from the root module (main.tf) */

output "container_network_info" {
  description = "Network identifiers concerning the container that was launched"
  value       = docker_container.nginx.network_data    # this is a return value to docker_container resource
}
