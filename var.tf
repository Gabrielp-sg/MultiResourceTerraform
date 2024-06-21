variable "REGION" {
  default = "us-east-1"
}
variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-1b"
}
variable "ZONE3" {
  default = "us-east-1c"
}
variable "Subnetid" {
  default = "subnet-08d3ae01c65b8fd03"
}
variable "AMIS" {
  default = {
    us-east-1 = "ami-00beae93a2d981137"
    us-east-2 = "ami-0ca2e925753ca2fb4"
  }
}
variable "USER" {
  default = "ec2-user"
}
variable "PUB_KEY" {
  default = "dovekey.pub"
}
variable "PRIV_KEY" {
  default = "dovekey"
}
variable "MYIP" {
  default = "177.157.16.207/32"

}