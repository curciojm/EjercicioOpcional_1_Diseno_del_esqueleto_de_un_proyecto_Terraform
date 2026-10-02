**Paso 1: Write (Escribir)**
Escribes la configuración en archivos 
.tf usando HCL (HashiCorp Configuration Language). Aquí es
donde defines tus Kinesis Streams, tablas de Glue o buckets de S3.

**-- PASO OLVIDADO FMT --**

**Paso 2: Init (Inicializar)**
terraform init Este comando prepara el directorio de trabajo. Descarga los Providers necesarios
(en nuestro caso, el proveedor de AWS). Un error común es olvidar que Terraform no "sabe" hablar
con AWS de forma nativa; utiliza este binario (provider) para traducir tus declaraciones de HCL en
llamadas a la API de AWS.

**-- PASO OVLIDADO VALIDATE --**

**Paso 3: Plan (La etapa de validación)**
terraform plan Esta es la fase más crítica para un entorno productivo. Terraform compara el código
que acabas de escribir con el State (lo que cree que existe) y con la Infraestructura Real (vía llamadas
de lectura a AWS).
• 
• 
¿Qué genera? Un reporte de "Diff" (diferencias). Te dirá exactamente qué recursos se crearán (
cuáles se modificarán (
~ ) y cuáles se destruirán (
+ ),- ).
Consejo experto: Nunca ejecutes un cambio en producción sin revisar el plan. Un cambio en una
propiedad "in-place" puede forzar la destrucción y recreación de un recurso que contiene datos.

**Paso 4: Apply (La ejecución)**
terraform apply Aquí es donde ocurre la magia. Terraform envía las solicitudes a AWS siguiendo el
grafo de dependencias. Si tu bucket de S3 debe existir antes de que Glue pueda escribir en él,
Terraform lo detectará y creará el bucket primero.

**Paso 5: Destroy**
terraform destroy Elimina toda la infraestructura gestionada por ese proyecto. En entornos de
datos de streaming, esto se usa para limpiar entornos de prueba efímeros y ahorrar costos de
infraestructura que, de otro modo, quedarían encendidos perpetuamente.

**Conclusion: OUTPUT**
Donde se realiza la conexion con el servicio

**Chequear y corregir formato**

terraform fmt

**Iniciar**

terraform init

Inicia el provedor, asi puede validar

**Validar**

terraform validate

**Plan**
<!-- + para agregado - para lo que va a quitar

 # local_file.eventos will be created
  + resource "local_file" "eventos" {
      + content              = jsonencode(
            {
              + name            -->

**Apply**
Muestra el plan y te pregunta si queres hacer esos cambios.