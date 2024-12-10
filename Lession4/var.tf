variable "vpcs" {
  description = "List of VPCs"
  type        = list(map(any))

  default = [
    {
      name    = "vpc-1"
      cidr    = "10.0.0.0/16"
      subnets = [
        {
          name = "subnet-1"
          cidr = "10.0.1.0/24"
        },
        {
          name = "subnet-2"
          cidr = "10.0.2.0/24"
        }
      ]
    },
    {
      name    = "vpc-2"
      cidr    = "10.0.0.0/16"
      subnets = [
        {
          name = "subnet-3"
          cidr = "10.0.3.0/24"
        },
        {
          name = "subnet-4"
          cidr = "10.0.4.0/24"
        }
      ]
    }
  ]
}