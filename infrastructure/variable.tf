variable "namespace" {
    type = string
    default = "homurabu"
    description = "The namespace where the helm resources will be created"
}

variable "helm" {
    type = list(object({
        name = string
        repository = string
        chart = string
        values = list(object({
            name = string
            value = any
        }))
    }))
    description = "Helm chart configuration"
}