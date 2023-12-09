central_project = "km1-runcloud"
entries = [{ entry_id = "bigquerytable_view"
  entry_group           = "bigquery"
  display_name          = "amex"
  description           = "test"
  user_specified_system = "users2"
  user_specified_type   = "bigqueryTableSpec"
  isfileset     = false
  file_patterns = []

  },
  {
    entry_id              = "table_"
    entry_group           = "bigquery"
    display_name          = "amex"
    description           = "test"
    user_specified_system = "user-"
    user_specified_type   = "bigqueryTableSpec"
    isfileset     = false
    file_patterns = []
  },
  {
    entry_id              = "big_query_3"
    entry_group           = "bigquery"
    display_name          = "amex"
    description           = "test"
    user_specified_system = "user1"
    user_specified_type   = "bigqueryTableSpec"             
    isfileset     = false
    file_patterns = []
  }
]

groups = ["bigquery"]


taxonomies = [
  {
    region                 = "us"
    display_name           = "First Taxonomy"
    description            = "Taxonomy example one"
    activated_policy_types = ["POLICY_TYPE_UNSPECIFIED", "FINE_GRAINED_ACCESS_CONTROL"]

  },
  {
    region                 = "us"
    display_name           = "Second Taxonomy"
    description            = "Taxonomy example two"
    activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
  }
]




tag_templates = [
  {
    tag_template_id = "tag_bigquery"
    region          = "us-central1"
    force_delete    = false
    display_name    = "first tag template"
    fields = [
      {
        field_id        = "foo"
        description     = "foo"
        display_name    = "foo"
        allowed_values  = []
        is_required     = false
        order           = 0
        is_enum         = false
        primitive_value = "BOOL"
      },
      {
        field_id        = "foo2"
        display_name    = "foo2"
        description     = "foo2"
        allowed_values  = []
        is_required     = false
        order           = 0
        is_enum         = false
        primitive_value = "DOUBLE"



      },
      {
        allowed_values  = ["foo4", "foo5"]
        field_id        = "foo3"
        display_name    = "foo3"
        description     = "foo3"
        is_required     = false
        order           = 0
        is_enum         = true
        primitive_value = "ENUM"
      }


    ]
  },

  {
    tag_template_id = "tag_big_query2"
    region          = "us-central1"
    display_name    = "first tag template"
    force_delete    = false
    fields = [{
      field_id        = "foo"
      display_name    = "foo"
      description     = "foo"
      allowed_values  = []
      is_required     = false
      order           = 0
      is_enum         = false
      primitive_value = "BOOL"
      }


    ]
  }
]