terraform {
  backend "s3" {
    bucket = "terraform-state-ritika"
    key    = "student-app/terraform.tfstate"
    region = "ap-south-1"
  }
}