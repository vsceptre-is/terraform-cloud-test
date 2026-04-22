terraform {
  required_providers {
    datadog = {
      source  = "Datadog/datadog"
    }
  }
  cloud  {
    organization = "test_migration_organization"
    workspaces {
      name = "terraform-migration-test" # Mutually exclusive with `tags`
    }            
  }
}

provider "datadog" {
  api_key = var.DATADOG_API_KEY
  app_key = var.DATADOG_APP_KEY
}

variable "DATADOG_API_KEY" {
  type      = string
  sensitive = true
}

variable "DATADOG_APP_KEY" {
  type      = string
  sensitive = true
}
