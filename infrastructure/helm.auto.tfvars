namespace = "homurabu"

helm = [
  {
    name       = "harbor"
    repository = "https://helm.goharbor.io"
    chart      = "harbor"
    set = [
      {
        name  = "ingress.enabled"
        value = true
      },
      {
        name  = "ingress.core.hostname"
        value = "harbor.homurabu.lab"
      }
    ]
  }
]
