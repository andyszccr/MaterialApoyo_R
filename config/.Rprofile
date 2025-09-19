# ==============================================================================
# ARCHIVO DE CONFIGURACIÓN R (.Rprofile)
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Configuración personalizada de R que se carga automáticamente
#              al iniciar RStudio. Incluye configuraciones globales, librerías
#              comunes y funciones útiles.
# ==============================================================================

# ==============================================================================
# CONFIGURACIÓN GLOBAL DE R
# ==============================================================================

# Configurar opciones globales
options(
  # Configuración de números
  digits = 4,                    # Número de dígitos a mostrar
  scipen = 999,                  # Evitar notación científica
  
  # Configuración de strings
  stringsAsFactors = FALSE,      # No convertir strings a factores automáticamente
  
  # Configuración de memoria
  max.print = 1000,              # Máximo número de líneas a imprimir
  
  # Configuración de gráficos
  device = "RStudioGD",          # Dispositivo de gráficos por defecto
  
  # Configuración de repositorios
  repos = c(CRAN = "https://cran.r-project.org/")
)

# ==============================================================================
# FUNCIONES ÚTILES PERSONALIZADAS
# ==============================================================================

# Función para instalar y cargar paquetes automáticamente
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# Función para limpiar el entorno de trabajo
clear_all <- function() {
  rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
  cat("Entorno de trabajo limpiado.\n")
}

# Función para mostrar información del sistema
sys_info <- function() {
  cat("=== INFORMACIÓN DEL SISTEMA ===\n")
  cat("Versión de R:", R.version.string, "\n")
  cat("Sistema operativo:", Sys.info()["sysname"], "\n")
  cat("Directorio de trabajo:", getwd(), "\n")
  cat("Memoria disponible:", memory.size(), "MB\n")
}

# Función para verificar paquetes instalados
check_packages <- function(packages) {
  installed <- packages %in% installed.packages()[,"Package"]
  missing <- packages[!installed]
  if (length(missing) > 0) {
    cat("Paquetes faltantes:", paste(missing, collapse = ", "), "\n")
  } else {
    cat("Todos los paquetes están instalados.\n")
  }
  return(installed)
}

# ==============================================================================
# CARGA AUTOMÁTICA DE LIBRERÍAS COMUNES
# ==============================================================================

# Lista de paquetes que se cargan automáticamente
auto_load <- c("tidyverse", "ggplot2", "dplyr")

# Cargar solo si están instalados
for (pkg in auto_load) {
  if (pkg %in% installed.packages()[,"Package"]) {
    suppressMessages(library(pkg, character.only = TRUE))
  }
}

# ==============================================================================
# CONFIGURACIÓN DE GRÁFICOS
# ==============================================================================

# Configurar tema por defecto para ggplot2
if ("ggplot2" %in% loadedNamespaces()) {
  theme_set(theme_minimal())
}

# Configurar parámetros de gráficos base
par(mar = c(4, 4, 2, 1))  # Márgenes por defecto

# ==============================================================================
# MENSAJE DE BIENVENIDA
# ==============================================================================

cat("\n")
cat("🎉 ¡Bienvenido al entorno MaterialApoyo_R!\n")
cat("📚 Repositorio de material de apoyo para aprender R\n")
cat("🔧 Funciones disponibles: ipak(), clear_all(), sys_info(), check_packages()\n")
cat("📁 Directorio actual:", getwd(), "\n")
cat("💡 Ejecuta 'source(\"config/install_packages.R\")' para instalar todas las dependencias\n")
cat("\n")
