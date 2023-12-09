module "data-catalog" {
  source          = "../../modules/data-catalog"
  tag_templates   = var.tag_templates
  groups          = var.groups
  entries         = var.entries
  central_project = var.central_project
  taxonomies      = var.taxonomies
}