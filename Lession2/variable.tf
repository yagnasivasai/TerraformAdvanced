variable "region" {
  type = string
  #   default = "ap-south-1"

}

variable "ec2config" {
  type = list(object({
    region        = string
    ami           = string
    instance_type = string
    key_name      = string
    instance_name = string
  }))

}

variable "vpcconfig" {
  type = object({
    cidr_block = string
  })
}


variable "subnetconfig" {
  type = list(object(
    {
      name       = string
      cidr_block = string
    }
  ))
}

variable "sgconfig" {
  type = object({
    protocol  = number
    self      = bool
    from_port = number
    to_port   = number
  })
}


# variable "ec2configs" {
#   default = [
#     {
#       ami           = "ami-0614680123427b75e"
#       instance_type = "t2.micro"
#       key_name      = "terraform"
#       name          = "test-server1"
#     },
#     {
#       ami           = "ami-0614680123427b75e"
#       instance_type = "t2.small"
#       key_name      = "terraform"
#       name          = "test-server2"
#     },
#     {
#       ami           = "ami-0614680123427b75e"
#       instance_type = "t2.medium"
#       key_name      = "terraform"
#       name          = "test-server3"
#     }
#   ]
# }
