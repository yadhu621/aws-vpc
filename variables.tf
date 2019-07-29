variable "aws_region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.0.16.0/22" # 1024 hosts
}

variable "public_cidr" {
  type    = "list"
  default = ["10.0.16.0/26", "10.0.16.64/26", "10.0.16.128/26"] # 64 hosts each
}

variable "azs" {
  type = "list"
  default = ["eu-west-2a","eu-west-2b","eu-west-2c"]
}

