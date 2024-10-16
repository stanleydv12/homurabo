namespace = "homurabu"

helm = [
  {
    name       = "harbor"
    repository = "https://helm.goharbor.io"
    chart      = "harbor"
    values = [
      {
        name  = "expose.ingress.hosts.core"
        value = "harbor.homurabu.lab"
      }
    ]
  }
]
