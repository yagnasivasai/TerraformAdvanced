variable "region" {
  type = string
}

variable "ec2config" {
  type = object({
    region        = string
    key_name      = string
    ami           = list(string)
    instance_type = list(string)
    instance_names = list(string)
  })

}


variable "vpcconfig" {
  type = object({
    cidr_block = string
  })
}

