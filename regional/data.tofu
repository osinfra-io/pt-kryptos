# Google Client Config Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/client_config

data "google_client_config" "this" {}

# Google Container Cluster Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/container_cluster

data "google_container_cluster" "this" {
  location = module.core_helpers.region
  name     = "pt-kryptos-${module.core_helpers.region}-${module.core_helpers.zone}"
  project  = data.google_projects.platform_managed.projects[0].project_id
}

# Google Projects Data Source
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/data-sources/projects
#
# Platform-managed projects are created by pt-corpus (labels.repository=pt-corpus).
# The labels.team filter scopes the lookup to the kryptos project specifically.

data "google_projects" "platform_managed" {
  filter = "parent.id:${replace(module.core_helpers.environment_folder_id, "folders/", "")} labels.repository:pt-corpus labels.team:${module.core_helpers.team} labels.project-type:platform-managed lifecycleState:ACTIVE"
}
