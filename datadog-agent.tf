resource "helm_release" "datadog" {
  name       = "datadog-agent"
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"
  namespace  = "datadog"  # Create if needed via kubernetes_namespace
  version    = "3.10.9"   # Use latest stable

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set {
    name  = "datadog.site"
    value = var.datadog_site
  }

  # Enable key features
  set { name = "datadog.logs.enabled", value = "true" }
  set { name = "clusterAgent.enabled", value = "true" }
  set { name = "datadog.apm.enabled", value = "true" }
}
