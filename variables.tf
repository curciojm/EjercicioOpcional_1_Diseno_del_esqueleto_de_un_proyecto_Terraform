# variables.tf: Define al menos 3 variables necesarias (ej: region, project_name, environment)

variable "environment" {
  type        = string
  description = "Entorno de despliegue"
  default     = "dev"
}

variable "shard_count" {
  type        = number
  description = "Cantidad de shards del stream"
  default     = 1
}

variable "project_name" {
  type        = string
  description = "Nombre del proyecto"
  default     = "plataforma-datos"
}