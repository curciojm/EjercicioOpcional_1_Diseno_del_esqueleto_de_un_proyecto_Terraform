# main.tf: Donde residirán los recursos principales (puedes dejar comentarios o un recurso de ejemplo como un S3 bucket).

resource "local_file" "eventos" {
  filename = "${path.module}/output/eventos-${var.environment}.json"
  # fijate que cada variable tiene que estar pasada como json
  content = jsonencode({
    project_name     = var.project_name
    name             = "eventos-${var.environment}"
    shard_count      = var.shard_count
    retention_period = 24
  })
}