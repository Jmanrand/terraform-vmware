terraform {
    backend "s3" {
    bucket = "jmanrand-terraform-backend"
    key = "vmwarestate/tfstate"
    region = "us-east-2"
    profile = "jmanrand"
  }
}