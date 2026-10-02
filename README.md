# Diseño del esqueleto de un proyecto Terraform

Proyecto correspondiente a la práctica de diseño de la estructura básica de un proyecto con **Terraform**.

## Estructura del proyecto

```text
.
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
└── README.md
```

### `provider.tf`

Contiene la configuración de Terraform y de los proveedores utilizados por el proyecto. También especifica la versión mínima de Terraform y la versión del proveedor.

### `main.tf`

Contiene los recursos principales que se desean gestionar mediante Terraform.

En este ejercicio se utiliza un recurso local como ejemplo, generando un archivo JSON a partir de las variables definidas en el proyecto.

### `variables.tf`

Define las variables utilizadas por el proyecto. Cada variable especifica su tipo, descripción y, cuando corresponde, un valor por defecto.

### `outputs.tf`

Define los valores que Terraform debe mostrar como resultado de la ejecución. En este proyecto se muestra la ruta del archivo generado.

### `terraform.tfvars`

Contiene los valores concretos de las variables utilizadas en el entorno, separados de la definición de las variables.

### `.gitignore`

Evita que archivos generados por Terraform o archivos de estado sean incluidos en el repositorio. Por ejemplo, se excluyen `.terraform/` y los archivos `*.tfstate`.

## Inicialización y ejecución

Para inicializar el proyecto y descargar los proveedores necesarios:

```bash
terraform init
```

Para verificar que la configuración sea válida:

```bash
terraform validate
```

Para formatear los archivos de configuración:

```bash
terraform fmt
```

Para visualizar los cambios que Terraform realizaría:

```bash
terraform plan
```

Para aplicar la configuración:

```bash
terraform apply
```

## Convención de nombres

Los recursos y archivos generados utilizan nombres descriptivos y, cuando corresponde, incorporan el entorno mediante la variable `environment`.

Por ejemplo:

```text
eventos-dev.json
```

De esta manera, los recursos pueden diferenciarse entre distintos entornos, como `dev`, `test` o `prod`.

## ¿Por qué separar la configuración en varios archivos?

Terraform permite organizar la configuración en diferentes archivos `.tf` dentro del mismo directorio. Separar las responsabilidades facilita la lectura, el mantenimiento y la reutilización del proyecto.

En este caso:

- `provider.tf` → configuración de Terraform y proveedores.
- `main.tf` → recursos principales.
- `variables.tf` → definición de variables.
- `outputs.tf` → resultados de la ejecución.
- `terraform.tfvars` → valores de las variables.

Podría colocarse toda la configuración en un único `main.tf`, pero separar los componentes permite mantener una estructura más clara y facilita el crecimiento del proyecto a medida que aumenta su complejidad.