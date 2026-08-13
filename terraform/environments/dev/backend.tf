terraform {
  backend "s3" {
    bucket       = "REPLACE-WITH-YOUR-TERRAFORM-STATE-BUCKET"
    key          = "eks/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}