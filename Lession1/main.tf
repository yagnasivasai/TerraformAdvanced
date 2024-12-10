resource "aws_instance" "terraform" {

  count         = length(var.ec2config.instance_names)
  ami           = var.ec2config.ami[count.index]
  instance_type = var.ec2config.instance_type[count.index]
  key_name      = var.ec2config.key_name

  lifecycle {
    # create_before_destroy = true
    # prevent_destroy = true
  }

  tags = {
    Name = var.ec2config.instance_names[count.index]
  }
  // Only create_before_destroy applies for only ami, for the name, instance_type terrafrom will modify the resource, it will not create or destroy
}




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

