terraform {
  backend "s3" {
    bucket         = "enterprise-migration-projet"
    key            = "wordpress-migration/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "Ent-dynamo"
    encrypt        = true
  }
}

