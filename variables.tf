variable "discovery_engine_search_engines" {
  description = <<EOT
Map of discovery_engine_search_engines, attributes below
Required:
    - collection_id
    - data_store_ids
    - display_name
    - engine_id
    - location
    - search_engine_config (block):
        - required_subscription_tier (optional)
        - search_add_ons (optional)
        - search_tier (optional)
Optional:
    - app_type
    - deletion_policy
    - disable_analytics
    - features
    - industry_vertical
    - kms_key_name
    - procurement_contact_emails
    - project
    - common_config (block):
        - company_name (optional)
    - knowledge_graph_config (block):
        - cloud_knowledge_graph_types (optional)
        - enable_cloud_knowledge_graph (optional)
        - enable_private_knowledge_graph (optional)
        - feature_config (optional, block):
            - disable_private_kg_auto_complete (optional)
            - disable_private_kg_enrichment (optional)
            - disable_private_kg_query_ui_chips (optional)
            - disable_private_kg_query_understanding (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    collection_id              = string
    data_store_ids             = list(string)
    display_name               = string
    engine_id                  = string
    location                   = string
    app_type                   = optional(string)
    deletion_policy            = optional(string)
    disable_analytics          = optional(bool)
    features                   = optional(map(string))
    industry_vertical          = optional(string)
    kms_key_name               = optional(string)
    procurement_contact_emails = optional(list(string))
    project                    = optional(string)
    search_engine_config = object({
      required_subscription_tier = optional(string)
      search_add_ons             = optional(list(string))
      search_tier                = optional(string)
    })
    common_config = optional(object({
      company_name = optional(string)
    }))
    knowledge_graph_config = optional(object({
      cloud_knowledge_graph_types    = optional(list(string))
      enable_cloud_knowledge_graph   = optional(bool)
      enable_private_knowledge_graph = optional(bool)
      feature_config = optional(object({
        disable_private_kg_auto_complete       = optional(bool)
        disable_private_kg_enrichment          = optional(bool)
        disable_private_kg_query_ui_chips      = optional(bool)
        disable_private_kg_query_understanding = optional(bool)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

