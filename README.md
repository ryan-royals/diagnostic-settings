<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diag](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.category](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | Name of the Diagnostic Setting to be created, presenting in the diagnostic configuration pane in the Azure Portal. | `string` | `"diag-logs"` | no |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | Resource ID of the Event Hub Authorization Rule to direct all logging to.<br>  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified. | `string` | `null` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Resource ID of the Log Analytics Workspace to direct all logging to.<br>  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified. | `string` | `null` | no |
| <a name="input_log_category_types_overwrites"></a> [log\_category\_types\_overwrites](#input\_log\_category\_types\_overwrites) | Map of lists for overwriting what log category types should be used per resource. <br>  If this is not supplied, all log category types are enabled by default.<br><br>  Map Key should be the Resource Type. This is the last static element of the Resource ID before the Resource Name. Examples are `storageAccounts`, `blobServices`, `vaults`<br>  List of Strings should be the types of log categories to be enabled.<br><br>  Example:<pre>log_category_type_overwrites = {<br>    vaults        = ["AuditEvent"]<br>    blobServices  = ["StorageWrite"]<br>  }</pre> | `map(list(string))` | `{}` | no |
| <a name="input_metrics_overwrites"></a> [metrics\_overwrites](#input\_metrics\_overwrites) | Map of lists for overwriting what metric category types should be used per resource. <br>  If this is not supplied, all metric category types are enabled by default.<br><br>  Map Key should be the Resource Type. This is the last static element of the Resource ID before the Resource Name. Examples are `storageAccounts`, `blobServices`, `vaults`<br>  List of Strings should be the types of metric categories to be enabled.<br><br>  Example:<pre>metric_category_type_overwrites = {<br>    blobServices  = ["Capacity"]<br>  }</pre> | `map(list(string))` | `{}` | no |
| <a name="input_partner_solution_id"></a> [partner\_solution\_id](#input\_partner\_solution\_id) | Resource ID of the Partner Solution to direct all logging to.<br>  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified. | `string` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Resource ID of the Storage Account to direct all logging to.<br>  At least one of `eventhub_authorization_rule_id`, `log_analytics_workspace_id`, `partner_solution_id` and `storage_account_id` must be specified. | `string` | `null` | no |
| <a name="input_target_resource_ids"></a> [target\_resource\_ids](#input\_target\_resource\_ids) | List of Resource ID's. <br>  Value should be the full resource ID of the target resource to enable logging for.<br><br>  Example:<pre>diagnostic_log_targets = [<br>    /subscriptions/*subscriptionId*/resourceGroups/*resourceGroupName*/providers/Microsoft.Storage/storageAccounts/*storageAccountName*,<br>    /subscriptions/*subscriptionId*/resourceGroups/*resourceGroupName*/providers/Microsoft.Storage/storageAccounts/*storageAccountName*/blobServices/default,<br>    /subscriptions/*subscriptionId*/resourceGroups/*resourceGroupName*/providers/Microsoft.KeyVault/vaults/*keyVaultName*<br>  ]</pre> | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->