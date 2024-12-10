resource "aws_instance" "terraform" {
  for_each = tomap({ for i, config in var.ec2config : config.instance_name => config })

  ami           = each.value.ami
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  tags = {
    Name = each.key
  }
}

