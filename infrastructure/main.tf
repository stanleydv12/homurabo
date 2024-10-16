resource "helm_release" "resources" {
  for_each   = var.helm
  helm_config = each.value

  name       = helm_config.name
  repository = helm_config.repository
  chart      = helm_config.chart
  namespace  = var.namespace

  set {
    for_each = helm_config.values
    name  = set.value.name
    value = set.value.value
  }
}