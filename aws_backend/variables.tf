variable "code_artefacts_path" {
  type = string
}

variable "deployment_info" {
  type = object({
    project_name = string
    environment = string
    region = string
  })
}
