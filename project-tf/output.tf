/* Understanding Modules
   output.tf - Outputs might be drawn from the root or from child modules. This example shows how to reach for a value made available within a child module. Note the pattern to reach a value within the child
               begins with "module". The usage pattern is "module.MODULE NAME.OUTPUT NAME FROM MODULE"  */

# an output value we want to extract from the child module
output "root_returning_child_module_output" {
  value = module.my_container.container_network_info       # module.MODULE NAME.OUTPUT NAME
  description = "ID of the docker image "                  # description of the output value
}
