terraform {
  backend "s3" {
    bucket = "moise-wordpress-migration-2026"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

