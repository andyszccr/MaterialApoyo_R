# ==============================================================================
# SCRIPT: Instalación de Paquetes para MaterialApoyo_R
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script instala todas las librerías necesarias para ejecutar
#              los ejercicios y proyectos del repositorio MaterialApoyo_R.
# ==============================================================================

# ==============================================================================
# FUNCIÓN AUXILIAR PARA INSTALACIÓN AUTOMÁTICA
# ==============================================================================

# Función para instalar y cargar paquetes automáticamente
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# ==============================================================================
# PAQUETES PRINCIPALES PARA ANÁLISIS DE DATOS
# ==============================================================================

# Paquetes del tidyverse (manipulación y visualización)
tidyverse_packages <- c(
  "tidyverse",    # Conjunto de paquetes para ciencia de datos
  "dplyr",        # Manipulación de datos
  "tidyr",        # Organización de datos
  "ggplot2",      # Gramática de gráficos
  "stringr",      # Manipulación de strings
  "lubridate",    # Trabajo con fechas
  "readr",        # Lectura de archivos
  "purrr"         # Programación funcional
)

# ==============================================================================
# PAQUETES PARA MODELADO Y MACHINE LEARNING
# ==============================================================================

ml_packages <- c(
  "cluster",      # Algoritmos de clustering
  "factoextra",   # Visualización de clusters
  "NbClust",      # Determinación del número óptimo de clusters
  "rpart",        # Árboles de decisión
  "rattle",       # Visualización de árboles
  "rpart.plot",   # Gráficos de árboles
  "randomForest", # Bosques aleatorios
  "caret",        # Entrenamiento y validación de modelos
  "boot",         # Bootstrap y validación cruzada
  "car",          # Regresión y análisis multivariado
  "QuantPsyc"     # Psicología cuantitativa y estadística
)

# ==============================================================================
# PAQUETES PARA VISUALIZACIÓN AVANZADA
# ==============================================================================

viz_packages <- c(
  "plotly",       # Gráficos interactivos
  "corrplot",     # Visualización de correlaciones
  "aplpack",      # Gráficos adicionales
  "sm",           # Gráficos suavizados
  "gapminder",    # Datasets para visualización
  "scales",       # Formateo de ejes
  "ggthemes"      # Temas adicionales para ggplot2
)

# ==============================================================================
# PAQUETES PARA ANÁLISIS ESTADÍSTICO
# ==============================================================================

stats_packages <- c(
  "modeest",      # Estadísticas de moda
  "mvtnorm",      # Distribuciones multivariadas
  "mice",         # Imputación de datos faltantes
  "openintro",    # Datasets educativos
  "summarytools", # Estadísticas descriptivas
  "funModeling",  # Análisis exploratorio rápido
  "VIM"           # Visualización de datos faltantes
)

# ==============================================================================
# PAQUETES PARA PROYECTOS ESPECÍFICOS
# ==============================================================================

project_packages <- c(
  "titanic",      # Dataset del Titanic
  "dendextend"    # Extensión de dendrogramas
)

# ==============================================================================
# INSTALACIÓN DE TODOS LOS PAQUETES
# ==============================================================================

cat("Instalando paquetes del tidyverse...\n")
ipak(tidyverse_packages)

cat("Instalando paquetes de machine learning...\n")
ipak(ml_packages)

cat("Instalando paquetes de visualización...\n")
ipak(viz_packages)

cat("Instalando paquetes estadísticos...\n")
ipak(stats_packages)

cat("Instalando paquetes de proyectos...\n")
ipak(project_packages)

# ==============================================================================
# VERIFICACIÓN DE INSTALACIÓN
# ==============================================================================

cat("\n=== VERIFICACIÓN DE INSTALACIÓN ===\n")

# Lista completa de paquetes
all_packages <- c(tidyverse_packages, ml_packages, viz_packages, 
                  stats_packages, project_packages)

# Verificar cuáles están instalados
installed <- installed.packages()[,"Package"]
missing <- setdiff(all_packages, installed)

if (length(missing) == 0) {
  cat("✅ Todos los paquetes se instalaron correctamente!\n")
} else {
  cat("⚠️  Los siguientes paquetes no se pudieron instalar:\n")
  for (pkg in missing) {
    cat("   -", pkg, "\n")
  }
}

cat("\n=== INSTALACIÓN COMPLETADA ===\n")
cat("Ahora puedes ejecutar todos los scripts del repositorio MaterialApoyo_R\n")
