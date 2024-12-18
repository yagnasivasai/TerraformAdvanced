terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}


# resource "aws_instance" "terraform" {

#   count = length(var.ec2config.instance_names)
#   ami           = var.ec2config.ami[count.index]
#   instance_type = var.ec2config.instance_type[count.index]
#   key_name      = var.ec2config.key_name

#   lifecycle {
#     # create_before_destroy = true
#     # prevent_destroy = true
#   }

#   tags = {
#     Name = var.ec2config.instance_names[count.index]
#   }
#   // Only create_before_destroy applies for only ami, for the name, instance_type terrafrom will modify the resource, it will not create or destroy
# }
// this is for plane object type and in that strings and list of strings in it.
# resource "aws_instance" "terraform" {
#   # for_each = {for s in var.ec2config: }
#   # for_each = tomap({ for i, config in var.ec2config : config.instance_name => config })

#   for_each = { for idx, name in var.ec2config.instance_names : name => {
#     ami           = var.ec2config.ami[idx]
#     instance_type = var.ec2config.instance_type[idx]
#     key_name      = var.ec2config.key_name
#     region        = var.ec2config.region
#     }
#   }

#   ami           = each.value.ami
#   instance_type = each.value.instance_type
#   key_name      = each.value.key_name

#   tags = {
#     Name = each.key
#   }
# }

resource "aws_instance" "terraform" {
  # for_each = tomap({ for i, config in var.ec2config : config.instance_name => config })
  for_each = tomap({ for i, config in var.ec2config : config.instance_name => config })

  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  tags = {
    Name = each.value.instance_name
  }

  lifecycle {
    create_before_destroy = true
  }
}

