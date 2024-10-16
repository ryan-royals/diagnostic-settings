locals {
  regex = {
    resource_type = "\\/([^\\/]+)\\/[^\\/]+$"
  }
}

data "azurerm_monitor_diagnostic_categories" "category" {
  count       = length(var.target_resource_ids)
  resource_id = var.target_resource_ids[count.index]
}

resource "azurerm_monitor_diagnostic_setting" "diag" {
  count = length(var.target_resource_ids)

  target_resource_id = var.target_resource_ids[count.index]

  name = var.diagnostic_setting_name

  log_analytics_workspace_id     = var.log_analytics_workspace_id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  partner_solution_id            = var.partner_solution_id
  storage_account_id             = var.storage_account_id


  dynamic "enabled_log" {
    for_each = try(
      var.log_category_types_overwrites[regex(local.regex.resource_type, var.target_resource_ids[count.index])[0]],
      data.azurerm_monitor_diagnostic_categories.category[count.index].log_category_types
    )
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = try(
      var.metrics_overwrites[regex(local.regex.resource_type, var.target_resource_ids[count.index])[0]],
      data.azurerm_monitor_diagnostic_categories.category[count.index].metrics
    )
    content {
      category = metric.value
    }
  }
}
