## Logging Destination Configuration

variable "log_analytics_workspace_id" {
  type        = string
  default     = null
  description = <<EOT
  Resource ID of the Log Analytics Workspace to direct all logging to.
  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified.
  EOT
}
variable "eventhub_authorization_rule_id" {
  type        = string
  default     = null
  description = <<EOT
  Resource ID of the Event Hub Authorization Rule to direct all logging to.
  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified.
  EOT
}
variable "partner_solution_id" {
  type        = string
  default     = null
  description = <<EOT
  Resource ID of the Partner Solution to direct all logging to.
  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified.
  EOT
}
variable "storage_account_id" {
  type        = string
  default     = null
  description = <<EOT
  Resource ID of the Storage Account to direct all logging to.
  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified.
  EOT
}

## Logging Target Configuration

variable "diagnostic_setting_name" {
  type        = string
  default     = "diag-logs"
  description = "Name of the Diagnostic Setting to be created, presenting in the diagnostic configuration pane in the Azure Portal."
  nullable    = false
}

variable "target_resource_ids" {
  type        = list(string)
  nullable    = false
  description = <<EOT
  List of Resource ID's. 
  Value should be the full resource ID of the target resource to enable logging for.

  Example:

  ```
  diagnostic_log_targets = [
    /subscriptions/*subscriptionId*/resourceGroups/*resourceGroupName*/providers/Microsoft.Storage/storageAccounts/*storageAccountName*,
    /subscriptions/*subscriptionId*/resourceGroups/*resourceGroupName*/providers/Microsoft.Storage/storageAccounts/*storageAccountName*/blobServices/default,
    /subscriptions/*subscriptionId*/resourceGroups/*resourceGroupName*/providers/Microsoft.KeyVault/vaults/*keyVaultName*
  ]
  ```
  EOT
}

variable "log_category_types_overwrites" {
  type        = map(list(string))
  default     = {}
  nullable    = false
  description = <<EOT
  Map of lists for overwriting what log category types should be used per resource. 
  If this is not supplied, all log category types are enabled by default.

  Map Key should be the Resource Type. This is the last static element of the Resource ID before the Resource Name. Examples are `storageAccounts`, `blobServices`, `vaults`
  List of Strings should be the types of log categories to be enabled.

  Example:

  ```
  log_category_type_overwrites = {
    vaults        = ["AuditEvent"]
    blobServices  = ["StorageWrite"]
  }

  ```
  EOT
}

variable "metrics_overwrites" {
  type        = map(list(string))
  default     = {}
  nullable    = false
  description = <<EOT
  Map of lists for overwriting what metric category types should be used per resource. 
  If this is not supplied, all metric category types are enabled by default.

  Map Key should be the Resource Type. This is the last static element of the Resource ID before the Resource Name. Examples are `storageAccounts`, `blobServices`, `vaults`
  List of Strings should be the types of metric categories to be enabled.

  Example:

  ```
  metric_category_type_overwrites = {
    blobServices  = ["Capacity"]
  }

  ```
  EOT
}
