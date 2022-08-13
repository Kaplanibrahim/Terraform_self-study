variable "ec2-ami" {
  default = "ami-0742b4e673072066f"
}

variable "ec2-type" {
  default = "t2.micro"
}

variable "ec2-key" {
  default = "ibrahim"
}
variable "num-of-bucket" {
  default = 3
}

variable "users" {
  default = ["santino", "michael", "fredo"]
}
