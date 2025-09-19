# ==============================================================================
# SCRIPT: Árbol de Decisión - Análisis de Supervivencia del Titanic
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script implementa un árbol de decisión para predecir la
#              supervivencia de los pasajeros del Titanic usando variables como
#              sexo y edad. Incluye visualización del árbol y predicciones.
# ==============================================================================

# ==============================================================================
# SECCIÓN 1: INSTALACIÓN Y CARGA DE LIBRERÍAS
# ==============================================================================

# Instalar paquetes necesarios (ejecutar solo si no están instalados)
install.packages("tidyverse")
install.packages('titanic')

# Cargar librerías para manipulación de datos y análisis
library(tidyverse)  # Para manipulación de datos (dplyr, tidyr, etc.)
library(titanic)    # Dataset del Titanic

# ==============================================================================
# SECCIÓN 2: CARGA Y EXPLORACIÓN DE DATOS
# ==============================================================================

# Cargar el dataset de entrenamiento del Titanic
data("titanic_train")

# Mostrar las primeras filas del dataset
head(titanic_train)

# ==============================================================================
# SECCIÓN 3: CONFIGURACIÓN PARA ÁRBOLES DE DECISIÓN
# ==============================================================================

# Instalar y cargar librerías específicas para árboles de decisión
library(rpart)      # Para crear árboles de decisión
install.packages('rattle')      # Para visualización avanzada
library(rattle)
install.packages('rpart.plot')  # Para gráficos del árbol
library(rpart.plot)

# ==============================================================================
# SECCIÓN 4: CONSTRUCCIÓN DEL ÁRBOL DE DECISIÓN
# ==============================================================================

# Crear el modelo de árbol de decisión
# NOTA: Los árboles de decisión no son 100% exactos, tienen un margen de error
arbol <- rpart(
  # Fórmula: predecir supervivencia basada en sexo y edad
  formula = Survived ~ Sex + Age,
  # Dataset de donde extraer los datos
  data = titanic_train,
  # Método de clasificación (no regresión)
  method = 'class'
)

#graficar el arbol
fancyRpartPlot(arbol)

#Prediccion si pasajero vivio o murio
predarbol<-predict(arbol,type = 'class')
#combinamos el arbol
titanic_pred <-cbind(titanic_train, predarbol)

#Predecir si una persona de 4 años sobrevivio
predict(arbol,
        newdata = data.frame(Age=4,Sex='male'),
        type = 'class')


