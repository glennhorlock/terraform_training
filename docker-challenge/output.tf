output "container_image_info" {
  description = "Container Image ID"
  value       = docker_container.simplgoservice.id    # Return IMAGE_ID Value
}
