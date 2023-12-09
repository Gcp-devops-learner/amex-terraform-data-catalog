
resource "google_data_catalog_entry_group" "entry_group" {
  for_each       = toset(var.groups)
  entry_group_id = each.value
}

resource "google_data_catalog_entry" "entries" {
  for_each              = { for entry in var.entries : entry.entry_id => entry }
  entry_id              = each.value.entry_id
  entry_group           = google_data_catalog_entry_group.entry_group["bigquery"].id
  display_name          = each.value.display_name
  description           = each.value.description
  user_specified_system = each.value.user_specified_system
  user_specified_type   = each.value.user_specified_type
  
}

resource "google_data_catalog_taxonomy" "taxonomies" {
  for_each               = { for taxonomy in var.taxonomies : "${taxonomy.display_name}.${taxonomy.region}" => taxonomy }
  provider               = google-beta
  region                 = each.value.region
  display_name           = each.value.display_name
  description            = each.value.description
  project                = var.central_project
  activated_policy_types = each.value.activated_policy_types
}

resource "google_data_catalog_tag_template" "tag_templates" {
  for_each        = { for tag_template in var.tag_templates : tag_template.tag_template_id => tag_template }
  tag_template_id = each.value.tag_template_id
  region          = each.value.region
  display_name    = each.value.display_name
  project         = var.central_project
  force_delete    = true

  #Create several fields blocks
  dynamic "fields" {
    for_each = { for field in lookup(each.value, "fields") : field.field_id => field }
    content {
      field_id     = lookup(fields.value, "field_id")
      display_name = lookup(fields.value, "display_name")
      description  = lookup(fields.value, "description")
      is_required  = lookup(fields.value, "is_required")
      order        = lookup(fields.value, "order")

      # Create primitive type if this fields require 

      dynamic "type" {
        for_each = lookup(fields.value, "is_enum") ? [] : [1]
        content {
          primitive_type = lookup(fields.value, "primitive_value")
        }
      }
      # Create enum  type if this fields require 

      dynamic "type" {
        for_each = lookup(fields.value, "is_enum") ? [1] : []
        content {
          enum_type {
            dynamic "allowed_values" {
              for_each = toset(length(lookup(fields.value, "allowed_values")) > 0 ? lookup(fields.value, "allowed_values") : [])
              content {
                display_name = allowed_values.value
              }
            }
          }
        }
      }
    }
  }
}