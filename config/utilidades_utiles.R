# ==============================================================================
# SCRIPT: Utilidades Útiles para R
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Funciones útiles y personalizadas para facilitar el trabajo con R
# ==============================================================================

# ==============================================================================
# FUNCIONES DE UTILIDAD GENERAL
# ==============================================================================

# Función para instalar y cargar múltiples paquetes
ipak <- function(pkg) {
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# Función para limpiar el entorno de trabajo
limpiar_entorno <- function() {
  rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
  gc()
  cat("Entorno de trabajo limpiado.\n")
}

# Función para mostrar información del sistema
info_sistema <- function() {
  cat("=== INFORMACIÓN DEL SISTEMA ===\n")
  cat("Versión de R:", R.version.string, "\n")
  cat("Sistema operativo:", Sys.info()["sysname"], Sys.info()["release"], "\n")
  cat("Directorio de trabajo:", getwd(), "\n")
  cat("Paquetes cargados:", length(.packages()), "\n")
  cat("Objetos en memoria:", length(ls()), "\n")
}

# ==============================================================================
# FUNCIONES DE ANÁLISIS DE DATOS
# ==============================================================================

# Función para resumen completo de un dataset
resumen_completo <- function(datos) {
  cat("=== RESUMEN COMPLETO DEL DATASET ===\n")
  cat("Dimensiones:", dim(datos)[1], "filas x", dim(datos)[2], "columnas\n")
  cat("Memoria utilizada:", format(object.size(datos), units = "MB"), "\n\n")
  
  cat("=== TIPOS DE DATOS ===\n")
  print(sapply(datos, class))
  cat("\n")
  
  cat("=== VALORES FALTANTES ===\n")
  faltantes <- sapply(datos, function(x) sum(is.na(x)))
  print(faltantes[faltantes > 0])
  if (sum(faltantes) == 0) cat("No hay valores faltantes.\n")
  cat("\n")
  
  cat("=== ESTADÍSTICAS DESCRIPTIVAS (VARIABLES NUMÉRICAS) ===\n")
  numericas <- sapply(datos, is.numeric)
  if (sum(numericas) > 0) {
    print(summary(datos[, numericas]))
  } else {
    cat("No hay variables numéricas.\n")
  }
  cat("\n")
  
  cat("=== VARIABLES CATEGÓRICAS ===\n")
  categoricas <- sapply(datos, function(x) is.factor(x) || is.character(x))
  if (sum(categoricas) > 0) {
    for (col in names(datos)[categoricas]) {
      cat("Variable:", col, "\n")
      print(table(datos[[col]], useNA = "ifany"))
      cat("\n")
    }
  } else {
    cat("No hay variables categóricas.\n")
  }
}

# Función para detectar outliers usando IQR
detectar_outliers <- function(x, factor = 1.5) {
  Q1 <- quantile(x, 0.25, na.rm = TRUE)
  Q3 <- quantile(x, 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  limite_inferior <- Q1 - factor * IQR
  limite_superior <- Q3 + factor * IQR
  outliers <- x < limite_inferior | x > limite_superior
  return(outliers)
}

# Función para calcular correlaciones con valores p
correlacion_completa <- function(datos) {
  numericas <- datos[sapply(datos, is.numeric)]
  if (ncol(numericas) < 2) {
    cat("Se necesitan al menos 2 variables numéricas para calcular correlaciones.\n")
    return(NULL)
  }
  
  cat("=== MATRIZ DE CORRELACIONES ===\n")
  cor_matrix <- cor(numericas, use = "complete.obs")
  print(round(cor_matrix, 3))
  
  cat("\n=== CORRELACIONES SIGNIFICATIVAS (p < 0.05) ===\n")
  # Calcular valores p
  n <- nrow(numericas)
  p_values <- matrix(NA, ncol(numericas), ncol(numericas))
  colnames(p_values) <- colnames(numericas)
  rownames(p_values) <- colnames(numericas)
  
  for (i in 1:ncol(numericas)) {
    for (j in 1:ncol(numericas)) {
      if (i != j) {
        test <- cor.test(numericas[, i], numericas[, j])
        p_values[i, j] <- test$p.value
      }
    }
  }
  
  # Mostrar solo correlaciones significativas
  significativas <- which(p_values < 0.05 & !is.na(p_values), arr.ind = TRUE)
  if (nrow(significativas) > 0) {
    for (k in 1:nrow(significativas)) {
      i <- significativas[k, 1]
      j <- significativas[k, 2]
      cat(sprintf("%s - %s: r = %.3f, p = %.3f\n", 
                  colnames(numericas)[i], 
                  colnames(numericas)[j],
                  cor_matrix[i, j], 
                  p_values[i, j]))
    }
  } else {
    cat("No se encontraron correlaciones significativas.\n")
  }
}

# ==============================================================================
# FUNCIONES DE VISUALIZACIÓN
# ==============================================================================

# Función para crear histogramas de todas las variables numéricas
histogramas_todas <- function(datos, bins = 30) {
  numericas <- datos[sapply(datos, is.numeric)]
  if (ncol(numericas) == 0) {
    cat("No hay variables numéricas para graficar.\n")
    return(NULL)
  }
  
  par(mfrow = c(ceiling(sqrt(ncol(numericas))), ceiling(sqrt(ncol(numericas)))))
  for (i in 1:ncol(numericas)) {
    hist(numericas[, i], main = colnames(numericas)[i], 
         xlab = colnames(numericas)[i], col = "lightblue", breaks = bins)
  }
  par(mfrow = c(1, 1))
}

# Función para crear gráficos de dispersión por pares
dispersion_pares <- function(datos, variables = NULL) {
  numericas <- datos[sapply(datos, is.numeric)]
  
  if (!is.null(variables)) {
    numericas <- numericas[variables]
  }
  
  if (ncol(numericas) < 2) {
    cat("Se necesitan al menos 2 variables numéricas para gráficos de dispersión.\n")
    return(NULL)
  }
  
  pairs(numericas, main = "Gráficos de Dispersión por Pares")
}

# ==============================================================================
# FUNCIONES DE EXPORTACIÓN
# ==============================================================================

# Función para exportar múltiples objetos a Excel
exportar_excel <- function(objetos, archivo = "resultados.xlsx") {
  if (!require(openxlsx, quietly = TRUE)) {
    install.packages("openxlsx")
    library(openxlsx)
  }
  
  wb <- createWorkbook()
  
  for (i in 1:length(objetos)) {
    nombre_hoja <- names(objetos)[i]
    if (is.null(nombre_hoja)) nombre_hoja <- paste0("Hoja", i)
    
    addWorksheet(wb, nombre_hoja)
    writeData(wb, nombre_hoja, objetos[[i]])
  }
  
  saveWorkbook(wb, archivo, overwrite = TRUE)
  cat("Archivo exportado:", archivo, "\n")
}

# Función para crear reporte HTML básico
crear_reporte_html <- function(datos, titulo = "Reporte de Análisis", archivo = "reporte.html") {
  if (!require(knitr, quietly = TRUE)) {
    install.packages("knitr")
    library(knitr)
  }
  
  html_content <- paste0(
    "<!DOCTYPE html>
    <html>
    <head>
      <title>", titulo, "</title>
      <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        h1 { color: #333; }
        h2 { color: #666; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
      </style>
    </head>
    <body>
      <h1>", titulo, "</h1>
      <h2>Información General</h2>
      <p><strong>Dimensiones:</strong> ", nrow(datos), " filas x ", ncol(datos), " columnas</p>
      <p><strong>Fecha de generación:</strong> ", Sys.Date(), "</p>
      
      <h2>Resumen de Datos</h2>",
      kable(summary(datos), format = "html"),
      "
    </body>
    </html>"
  )
  
  writeLines(html_content, archivo)
  cat("Reporte HTML creado:", archivo, "\n")
}

# ==============================================================================
# FUNCIONES DE VALIDACIÓN
# ==============================================================================

# Función para validar estructura de datos
validar_datos <- function(datos) {
  cat("=== VALIDACIÓN DE DATOS ===\n")
  
  # Verificar dimensiones
  if (nrow(datos) == 0) {
    cat("❌ ERROR: El dataset está vacío.\n")
    return(FALSE)
  }
  
  if (ncol(datos) == 0) {
    cat("❌ ERROR: El dataset no tiene columnas.\n")
    return(FALSE)
  }
  
  cat("✅ Dimensiones válidas:", nrow(datos), "x", ncol(datos), "\n")
  
  # Verificar nombres de columnas
  nombres_validos <- !grepl("^[0-9]", names(datos)) & 
                     !grepl("[^A-Za-z0-9._]", names(datos))
  
  if (any(!nombres_validos)) {
    cat("⚠️  ADVERTENCIA: Algunos nombres de columnas no son estándar.\n")
    cat("Columnas problemáticas:", names(datos)[!nombres_validos], "\n")
  } else {
    cat("✅ Nombres de columnas válidos.\n")
  }
  
  # Verificar tipos de datos
  tipos <- sapply(datos, class)
  cat("✅ Tipos de datos detectados:", paste(unique(tipos), collapse = ", "), "\n")
  
  # Verificar valores faltantes
  faltantes <- sapply(datos, function(x) sum(is.na(x)))
  total_faltantes <- sum(faltantes)
  
  if (total_faltantes > 0) {
    cat("⚠️  ADVERTENCIA:", total_faltantes, "valores faltantes encontrados.\n")
  } else {
    cat("✅ No hay valores faltantes.\n")
  }
  
  cat("✅ Validación completada.\n")
  return(TRUE)
}

# ==============================================================================
# FUNCIONES DE EJEMPLO DE USO
# ==============================================================================

# Función para mostrar ejemplos de uso
ejemplos_uso <- function() {
  cat("=== EJEMPLOS DE USO DE LAS UTILIDADES ===\n\n")
  
  cat("1. Cargar paquetes:\n")
  cat("   ipak(c('tidyverse', 'ggplot2', 'dplyr'))\n\n")
  
  cat("2. Limpiar entorno:\n")
  cat("   limpiar_entorno()\n\n")
  
  cat("3. Ver información del sistema:\n")
  cat("   info_sistema()\n\n")
  
  cat("4. Resumen completo de datos:\n")
  cat("   resumen_completo(mtcars)\n\n")
  
  cat("5. Detectar outliers:\n")
  cat("   outliers <- detectar_outliers(mtcars$mpg)\n\n")
  
  cat("6. Correlaciones completas:\n")
  cat("   correlacion_completa(mtcars)\n\n")
  
  cat("7. Histogramas de todas las variables:\n")
  cat("   histogramas_todas(mtcars)\n\n")
  
  cat("8. Gráficos de dispersión:\n")
  cat("   dispersion_pares(mtcars)\n\n")
  
  cat("9. Exportar a Excel:\n")
  cat("   exportar_excel(list(resumen = summary(mtcars)), 'resultados.xlsx')\n\n")
  
  cat("10. Validar datos:\n")
  cat("    validar_datos(mtcars)\n\n")
}

# Mostrar ejemplos al cargar el script
cat("=== UTILIDADES CARGADAS ===\n")
cat("Funciones disponibles:\n")
cat("- ipak(): Instalar y cargar paquetes\n")
cat("- limpiar_entorno(): Limpiar workspace\n")
cat("- info_sistema(): Información del sistema\n")
cat("- resumen_completo(): Resumen detallado de datos\n")
cat("- detectar_outliers(): Detectar valores atípicos\n")
cat("- correlacion_completa(): Análisis de correlaciones\n")
cat("- histogramas_todas(): Histogramas múltiples\n")
cat("- dispersion_pares(): Gráficos de dispersión\n")
cat("- exportar_excel(): Exportar a Excel\n")
cat("- validar_datos(): Validar estructura de datos\n")
cat("\nPara ver ejemplos de uso: ejemplos_uso()\n")
