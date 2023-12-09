variable "tag_templates" {
  type = list(object({
    tag_template_id = string
    region          = string
    display_name    = string
    fields = list(object({
      field_id        = string
      display_name    = string
      description     = string
      is_required     = bool
      order           = number
      is_enum         = bool
      primitive_value = string
      allowed_values  = list(string)
    }))
    force_delete = bool
  }))
  default     = []
  description = " Describe Tag_templates for each project"
}

variable "central_project" {
  type        = string
  default     = ""
  description = "Central Project"
}

variable "groups" {
  type    = list(string)
  default = []
}

variable "entries" {
  type = list(object({

    entry_id              = string
    entry_group           = string
    display_name          = string
    description           = string
    user_specified_system = string
    user_specified_type   = string
    isfileset             = bool
    file_patterns         = list(string)
  }))

  default = []
}

variable "taxonomies" {
  type = list(object({
    region                 = string
    display_name           = string
    description            = string
    activated_policy_types = list(string)
  }))
}