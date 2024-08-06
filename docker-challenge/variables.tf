variable "container_name" {
  description = "name of the container"
  type        = string
  default     = "Alta3ResearchWebService"
}

variable "internal" {
  description = "Internal port of the container"
  type        = number
  default     = 9876
}

variable "external" {
  description = "External port on the container"
  type        = number
  default     = 5432
}

