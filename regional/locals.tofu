# Local Values
# https://opentofu.org/docs/language/values/locals
#
# Helm set values derived from OpenTofu context and environment-specific variables.

locals {
  helm_set_values = concat(
    [
      {
        name  = "server.extraLabels.env"
        value = module.core_helpers.environment
      },
      {
        name  = "server.extraLabels.team"
        value = "pt-kryptos"
      },
    ],
    var.openbao_helm_set_values,
  )
}
