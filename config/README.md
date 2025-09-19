# ⚙️ Configuración del Proyecto

Esta carpeta contiene archivos de configuración para el entorno de desarrollo y gestión de dependencias.

## 📁 Archivos de Configuración

### `.Rprofile`
Configuración personalizada de R que se carga automáticamente al iniciar RStudio.

**Contenido típico:**
- Configuración de opciones globales
- Carga automática de librerías comunes
- Definición de funciones útiles
- Configuración de repositorios

### `install_packages.R`
Script para instalar todas las librerías necesarias para el proyecto.

**Librerías incluidas:**
- `tidyverse`: Manipulación y visualización de datos
- `cluster`: Algoritmos de clustering
- `factoextra`: Visualización de clusters
- `rpart`: Árboles de decisión
- `plotly`: Gráficos interactivos
- `ggplot2`: Gramática de gráficos
- `dplyr`: Manipulación de datos

### `renv.lock`
Archivo de bloqueo para el sistema de gestión de dependencias `renv`.

**Beneficios:**
- Reproducibilidad del entorno
- Control de versiones de paquetes
- Instalación automática de dependencias
- Aislamiento de proyectos

## 🚀 Configuración Inicial

### 1. Instalar R y RStudio
- Descargar R desde [CRAN](https://cran.r-project.org/)
- Instalar RStudio desde [RStudio.com](https://www.rstudio.com/)

### 2. Configurar el Proyecto
```r
# Instalar renv si no está disponible
if (!require("renv")) install.packages("renv")

# Inicializar renv en el proyecto
renv::init()

# Restaurar dependencias
renv::restore()
```

### 3. Instalar Paquetes Adicionales
```r
# Ejecutar el script de instalación
source("config/install_packages.R")
```

## 🔧 Configuración de RStudio

### Temas y Apariencia
- Usar tema oscuro para reducir fatiga visual
- Configurar tamaño de fuente apropiado
- Habilitar sintaxis highlighting

### Configuración de Código
- Habilitar auto-completado
- Configurar indentación automática
- Activar verificación de sintaxis en tiempo real

### Configuración de Proyecto
- Establecer directorio de trabajo
- Configurar archivos temporales
- Habilitar control de versiones con Git

## 📝 Buenas Prácticas

### Gestión de Paquetes
- Usar `renv` para aislamiento de proyectos
- Documentar todas las dependencias
- Mantener versiones específicas de paquetes críticos

### Organización del Código
- Usar proyectos de RStudio
- Estructurar código en funciones reutilizables
- Mantener scripts organizados por funcionalidad

### Documentación
- Comentar código complejo
- Usar roxygen2 para documentación de funciones
- Mantener README actualizado
