resource "aws_vpc" "example" {
  for_each = { for v in var.vpcs : v.name => v }

  cidr_block = each.value.cidr

  tags = {
    Name = each.key
  }
}

resource "aws_subnet" "example" {
  for_each = { for v in var.vpcs, s in v.subnets : "${v.name}-${s.name}" => s }

  vpc_id     = aws_vpc.example[split("-", each.key)[0]].id
  cidr_block = each.value.cidr

  tags = {
    Name = each.key
  }
}