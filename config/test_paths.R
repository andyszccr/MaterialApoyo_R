# ==============================================================================
# SCRIPT: Validación de Rutas y Archivos
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script valida que todas las rutas de archivos y datasets
#              estén correctamente configuradas después de la reorganización.
# ==============================================================================

# ==============================================================================
# FUNCIÓN DE VALIDACIÓN
# ==============================================================================

# Función para verificar si un archivo existe
check_file <- function(file_path, description) {
  if (file.exists(file_path)) {
    cat("✅", description, "- Archivo encontrado:", file_path, "\n")
    return(TRUE)
  } else {
    cat("❌", description, "- Archivo NO encontrado:", file_path, "\n")
    return(FALSE)
  }
}

# ==============================================================================
# VALIDACIÓN DE DATASETS
# ==============================================================================

cat("=== VALIDACIÓN DE DATASETS ===\n")

datasets_to_check <- list(
  c("../datasets/BikeData.csv", "Dataset de bicicletas"),
  c("../datasets/census-retail.csv", "Dataset del censo retail"),
  c("../datasets/gym_members_exercise_tracking.csv", "Dataset de gimnasio"),
  c("../datasets/gym_members_exercise_tracking1.csv", "Dataset de gimnasio (copia)"),
  c("../datasets/students_with_dates.csv", "Dataset de estudiantes con fechas")
)

datasets_valid <- sapply(datasets_to_check, function(x) check_file(x[1], x[2]))

# ==============================================================================
# VALIDACIÓN DE SCRIPTS PRINCIPALES
# ==============================================================================

cat("\n=== VALIDACIÓN DE SCRIPTS PRINCIPALES ===\n")

scripts_to_check <- list(
  c("../01_Introduccion_R/ejercicios_basicos/01 Practica de Ejercicios R.R", "Ejercicios básicos"),
  c("../02_Manipulacion_Datos/dataframes/04 Leer un csv.R", "Script de lectura CSV"),
  c("../02_Manipulacion_Datos/limpieza_datos/Practica stringr - lubridate.R", "Script de limpieza"),
  c("../03_Visualizacion/graficos_basicos/Ejercicios graficas base y ggplot2.R", "Script de gráficos"),
  c("../04_Modelado/clustering/kmeans.r", "Script de clustering"),
  c("../05_Analisis_Exploratorio/practicas_eda/Practica EDA.R", "Script de EDA"),
  c("../proyectos_finales/02 Proyecto Final Gimnasio.R", "Proyecto final gimnasio"),
  c("../proyectos_finales/03  Arbol de desición Titanic.R", "Proyecto árbol de decisión")
)

scripts_valid <- sapply(scripts_to_check, function(x) check_file(x[1], x[2]))

# ==============================================================================
# VALIDACIÓN DE DOCUMENTACIÓN
# ==============================================================================

cat("\n=== VALIDACIÓN DE DOCUMENTACIÓN ===\n")

docs_to_check <- list(
  c("../README.md", "README principal"),
  c("../01_Introduccion_R/README.md", "README introducción"),
  c("../02_Manipulacion_Datos/README.md", "README manipulación"),
  c("../03_Visualizacion/README.md", "README visualización"),
  c("../04_Modelado/README.md", "README modelado"),
  c("../05_Analisis_Exploratorio/README.md", "README EDA"),
  c("../datasets/README.md", "README datasets"),
  c("../proyectos_finales/README.md", "README proyectos"),
  c("../examenes/README.md", "README exámenes"),
  c("../documentacion/README.md", "README documentación"),
  c("../config/README.md", "README configuración")
)

docs_valid <- sapply(docs_to_check, function(x) check_file(x[1], x[2]))

# ==============================================================================
# RESUMEN DE VALIDACIÓN
# ==============================================================================

cat("\n=== RESUMEN DE VALIDACIÓN ===\n")
cat("Datasets válidos:", sum(datasets_valid), "de", length(datasets_valid), "\n")
cat("Scripts válidos:", sum(scripts_valid), "de", length(scripts_valid), "\n")
cat("Documentación válida:", sum(docs_valid), "de", length(docs_valid), "\n")

total_valid <- sum(datasets_valid) + sum(scripts_valid) + sum(docs_valid)
total_files <- length(datasets_valid) + length(scripts_valid) + length(docs_valid)

cat("\nTotal archivos validados:", total_valid, "de", total_files, "\n")

if (total_valid == total_files) {
  cat("🎉 ¡TODOS LOS ARCHIVOS ESTÁN CORRECTAMENTE ORGANIZADOS!\n")
} else {
  cat("⚠️  Algunos archivos necesitan atención.\n")
}

cat("\n=== VALIDACIÓN COMPLETADA ===\n")
