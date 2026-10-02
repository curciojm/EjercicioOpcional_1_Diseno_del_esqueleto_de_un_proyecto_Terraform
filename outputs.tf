# outputs.tf: Define un output de ejemplo.

output "ruta" {
  value = local_file.eventos.filename
}