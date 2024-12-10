region = "ap-south-1"

vpcconfig = {
  cidr_block = "10.10.0.0/16"
}

ec2config = {
  ami            = ["ami-053b12d3152c0cc71", "ami-0614680123427b75e", "ami-0614680123427b75e"]
  instance_type  = ["t2.micro", "t2.nano", "t2.micro"]
  key_name       = "terraform"
  region         = "ap-south-1"
  instance_names = ["test-server11", "test-server22", "test-server33"]
}