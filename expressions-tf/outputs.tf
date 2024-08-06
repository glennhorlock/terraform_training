## Output value definitions

# loop across all of the created instances docker_container.nginx (there are 4 of these)
# create an object containing "name" mapped to the container.name, as well as "host" mapped to the ip:external port
output "nginx_hosts" {
  value = [for container in docker_container.nginx : { name : container.name, host : "${container.ports[0].ip}:${container.ports[0].external}" }]
}
