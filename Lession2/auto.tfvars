region = "ap-south-1"

ec2config = [{
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  key_name      = "terraform"
  region        = "ap-south-1"
  instance_name = "test-server11"
  },
  {
    ami           = "ami-0614680123427b75e"
    instance_type = "t2.nano"
    key_name      = "terraform"
    region        = "ap-south-1"
    instance_name = "test-server22"
  },
  {
    ami           = "ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name      = "terraform"
    region        = "ap-south-1"
    instance_name = "test-server33"
}]

subnetconfig = [{
  name       = "subnet-1"
  cidr_block = "10.10.1.0/24"
  }, {
  name       = "subnet-2"
  cidr_block = "10.10.2.0/24"
}]
vpcconfig = {
  cidr_block = "10.10.0.0/16"
}

sgconfig = {
  protocol  = -1
  from_port = 0
  to_port   = 0
  self      = true
}