variable "tags" {
    type = map(string)
    default = {
        Project = "achroma-fan-site"
    }
}

variable "aws_provider" {
  type = object({
    region = string
  })
}
