variable "ec2-ami" {
  type = string
  default = "ami-0742b4e673072066f"
}

variable "ec2-type" {
  type = string
  default = "t2.micro"
}

variable "ec2-key" {
  type = string
  default = "ibrahim"
}
variable "num-of-bucket" {
  type = number
  default = 3
}

variable "users" {
  type = list(string)
  default = ["santino", "michael", "fredo"]
}
