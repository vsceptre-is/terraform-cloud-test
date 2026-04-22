resource "datadog_monitor" "loop_monitors"{
  for_each = {for monitor in local.json_data : monitor.name => monitor}
  name = each.value.name
  type = each.value.type
  query = each.value.query

  message = each.value.message

  monitor_thresholds{
    critical = each.value.critical
    warning = each.value.warning
  }
}