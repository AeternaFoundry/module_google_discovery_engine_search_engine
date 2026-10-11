resource "google_discovery_engine_search_engine" "discovery_engine_search_engines" {
  for_each = var.discovery_engine_search_engines

  collection_id              = each.value.collection_id
  data_store_ids             = each.value.data_store_ids
  display_name               = each.value.display_name
  engine_id                  = each.value.engine_id
  location                   = each.value.location
  app_type                   = each.value.app_type
  deletion_policy            = each.value.deletion_policy
  disable_analytics          = each.value.disable_analytics
  features                   = each.value.features
  industry_vertical          = each.value.industry_vertical
  kms_key_name               = each.value.kms_key_name
  procurement_contact_emails = each.value.procurement_contact_emails
  project                    = each.value.project

  search_engine_config {
    required_subscription_tier = each.value.search_engine_config.required_subscription_tier
    search_add_ons             = each.value.search_engine_config.search_add_ons
    search_tier                = each.value.search_engine_config.search_tier
  }

  dynamic "common_config" {
    for_each = each.value.common_config != null ? [each.value.common_config] : []
    content {
      company_name = common_config.value.company_name
    }
  }

  dynamic "knowledge_graph_config" {
    for_each = each.value.knowledge_graph_config != null ? [each.value.knowledge_graph_config] : []
    content {
      cloud_knowledge_graph_types    = knowledge_graph_config.value.cloud_knowledge_graph_types
      enable_cloud_knowledge_graph   = knowledge_graph_config.value.enable_cloud_knowledge_graph
      enable_private_knowledge_graph = knowledge_graph_config.value.enable_private_knowledge_graph
      dynamic "feature_config" {
        for_each = knowledge_graph_config.value.feature_config != null ? [knowledge_graph_config.value.feature_config] : []
        content {
          disable_private_kg_auto_complete       = feature_config.value.disable_private_kg_auto_complete
          disable_private_kg_enrichment          = feature_config.value.disable_private_kg_enrichment
          disable_private_kg_query_ui_chips      = feature_config.value.disable_private_kg_query_ui_chips
          disable_private_kg_query_understanding = feature_config.value.disable_private_kg_query_understanding
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

