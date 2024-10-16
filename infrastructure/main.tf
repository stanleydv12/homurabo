resource "helm_release" "resources" {
  for_each = { for helm_config in var.helm : helm_config.name => helm_config }

  name       = each.value.name
  repository = each.value.repository
  chart      = each.value.chart
  namespace  = var.namespace

  dynamic "set" {
    for_each = each.value.values
    content {
      name  = set.value.name
      value = set.value.value
    }
  }
}