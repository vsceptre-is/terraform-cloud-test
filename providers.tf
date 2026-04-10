terraform {
  required_providers {
    datadog = {
      source  = "Datadog/datadog"
    }
  }
  cloud  {
    organization = "terraform-test-migration"
    workspaces {
      name = "terraform-cloud-test" # Mutually exclusive with `tags`
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

resource "datadog_monitor" "slo_monitor_test" {
  message="Test SLO monitor3"
  query="error_budget(\"4e3466931bdb53839183e40ff16f3260\").over(\"7d\") > 90"
  name="Test SLO monitor3"
  type="slo alert"
  monitor_thresholds  {
    critical = 90
  }
}
resource "datadog_monitor" "cpu_high" {
  name  = "tested_terraform_cloud3"
  type  = "metric alert"
  query = "avg(last_5m):avg:system.cpu.user{env:prod} by {host} > 80"

  message = "High CPU in prod."

  monitor_thresholds {
    critical = 80
    warning  = 70
  }
}
