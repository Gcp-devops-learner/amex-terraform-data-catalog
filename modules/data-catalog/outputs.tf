
output "tag_templates" {
  value       = { for tag_template in google_data_catalog_tag_template.tag_templates : tag_template.name => tag_template }
  description = "value"
}

output "entries" {
  value       = { for entry in google_data_catalog_entry.entries : entry.id => entry }
  description = "value"
}

output "entries_groups" {
  value       = { for entry_group in google_data_catalog_entry_group.entry_group : entry_group.id => entry_group }
  description = "value"
}

output "taxonomies" {
  value = { for taxonomy, value in google_data_catalog_taxonomy.taxonomies : taxonomy => value }
}