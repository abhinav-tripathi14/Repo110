terraform {

  required_version = ">= 1.4.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.47.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.55"
    }
    time = {
      source  = "hashicorp/time"
      version = "~>0.11"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~>0.55.0"
    }
  }
}


provider "databricks" {
  alias      = "account"
  host       = var.databricks_base_account_url
  account_id = var.databricks_account_id

  client_id     = var.client_id
  client_secret = var.client_secret
}

provider "aws" {
  allowed_account_ids = local.allowed_aws_account_ids
  assume_role {
    role_arn = local.assume_role_arn
  }
  region = local.region
  default_tags {
    tags = local.common_tags
  }
}