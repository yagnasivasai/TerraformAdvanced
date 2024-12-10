resource "aws_vpc" "terraform" {
  cidr_block = var.vpcconfig.cidr_block

  lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true 
  }

  tags = {
    Name = "test-vpc"
  }
  // so if we create a resource with create_before_destroy and then change the code to prevent_destroy, the resource will not be deleted
}

resource "aws_subnet" "terraform" {
  for_each = tomap({ for i, config in var.subnetconfig : config.name => config })

  vpc_id     = aws_vpc.terraform.id
  cidr_block = each.value.cidr_block

  tags = {
    Name = each.key
  }
}

resource "aws_default_security_group" "terraform" {
  vpc_id = aws_vpc.terraform.id

  ingress {
    protocol  = var.sgconfig.protocol
    self      = var.sgconfig.self
    from_port = var.sgconfig.from_port
    to_port   = var.sgconfig.to_port
  }
}