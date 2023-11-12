variable "REGION" {
  default = "ap-south-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1  = "ami-0fc5d935ebf8bc3bc",
    ap-south-1 = "ami-0287a05f0ef0e9d9a"
  }
}

variable "SECURITY_GRP" {
  default = "sg-038248fd520eba230"
}

variable "USER" {
  default = "ubuntu"
}