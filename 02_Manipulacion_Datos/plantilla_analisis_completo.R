# ==============================================================================
# PLANTILLA: Análisis Completo de Datos
# AUTOR: [Tu nombre]
# FECHA: [Fecha]
# DESCRIPCIÓN: Plantilla estándar para análisis completo de datasets
# ==============================================================================

# ==============================================================================
# 1. CONFIGURACIÓN Y CARGA DE LIBRERÍAS
# ==============================================================================

# Limpiar entorno
rm(list = ls())

# Cargar librerías necesarias
library(tidyverse)    # Manipulación y visualización
library(ggplot2)      # Gráficos
library(readr)        # Lectura de archivos
library(dplyr)        # Manipulación de datos

# ==============================================================================
# 2. CARGA DE DATOS
# ==============================================================================

# Cargar dataset
datos <- read.csv("../../datasets/[nombre_dataset].csv")

# Exploración inicial
head(datos)
str(datos)
summary(datos)
dim(datos)

# ==============================================================================
# 3. LIMPIEZA DE DATOS
# ==============================================================================

# Verificar valores faltantes
sum(is.na(datos))
colSums(is.na(datos))

# Eliminar o imputar valores faltantes según sea necesario
# datos <- datos %>% drop_na()
# datos <- datos %>% fill([columna])

# Verificar duplicados
sum(duplicated(datos))

# ==============================================================================
# 4. ANÁLISIS EXPLORATORIO
# ==============================================================================

# Estadísticas descriptivas
datos %>%
  select_if(is.numeric) %>%
  summary()

# Análisis de variables categóricas
datos %>%
  select_if(is.character) %>%
  sapply(table)

# ==============================================================================
# 5. VISUALIZACIONES
# ==============================================================================

# Histograma para variables numéricas
datos %>%
  select_if(is.numeric) %>%
  pivot_longer(everything()) %>%
  ggplot(aes(x = value)) +
  geom_histogram(bins = 30) +
  facet_wrap(~name, scales = "free") +
  theme_minimal()

# Gráfico de barras para variables categóricas
# [Agregar código específico según variables]

# ==============================================================================
# 6. ANÁLISIS ESTADÍSTICO
# ==============================================================================

# Correlaciones entre variables numéricas
datos %>%
  select_if(is.numeric) %>%
  cor() %>%
  corrplot::corrplot()

# Pruebas estadísticas
# [Agregar pruebas específicas según objetivos]

# ==============================================================================
# 7. CONCLUSIONES
# ==============================================================================

# Resumir hallazgos principales
# [Escribir conclusiones del análisis]
