resource "aws_instance" "terraform" {
  # for_each = {for s in var.ec2config: }
  # for_each = tomap({ for i, config in var.ec2config : config.instance_name => config })

  for_each = { for idx, name in var.ec2config.instance_names : name => {
    ami           = var.ec2config.ami[idx]
    instance_type = var.ec2config.instance_type[idx]
    key_name      = var.ec2config.key_name
    region        = var.ec2config.region
    }
  }

  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  tags = {
    Name = each.key
  }
}

