terraform {
  backend "s3" {
    bucket = "terra-backend-vpc-eu"
    key    = "terraform_ex6"
    region = "us-east-1"
  }
}