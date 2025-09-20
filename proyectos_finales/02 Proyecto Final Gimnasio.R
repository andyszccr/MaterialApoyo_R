# ==============================================================================
# SCRIPT: Proyecto Final - Análisis de Datos de Gimnasio
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script realiza un análisis completo de datos de seguimiento
#              de ejercicios en gimnasio, incluyendo análisis exploratorio,
#              correlaciones, estadísticas descriptivas y visualizaciones.
# OBJETIVOS: Analizar patrones en el comportamiento de ejercicio, correlaciones
#            entre variables y generar insights para el negocio del gimnasio.
# ==============================================================================

# ==============================================================================
# SECCIÓN 1: CARGA DE LIBRERÍAS
# ==============================================================================

# Cargar librerías principales
library(tidyverse)  # Manipulación y visualización de datos
library(ggplot2)    # Gramática de gráficos
library(dplyr)      # Manipulación de datos
library(plotly)     # Gráficos interactivos

# Librerías para análisis estadístico
library(boot)       # Bootstrap y validación cruzada
library(car)        # Regresión y análisis multivariado
library(QuantPsyc)  # Estadísticas avanzadas

# Librerías para machine learning
library(NbClust)    # Determinación de clusters
library(factoextra) # Visualización de clusters
library(mvtnorm)    # Distribuciones multivariadas
library(dendextend) # Dendrogramas
library(rpart)      # Árboles de decisión

# Librerías para visualización
library(aplpack)    # Gráficos adicionales
library(corrplot)   # Matrices de correlación
library(sm)         # Gráficos suavizados
library(modeest)    # Estadísticas de moda

# Librerías para análisis de datos faltantes
library(mice)       # Imputación múltiple
library(gapminder)  # Datasets de referencia

# ==============================================================================
# SECCIÓN 2: CARGA Y PREPARACIÓN DE DATOS
# ==============================================================================

# Cargar dataset desde la carpeta datasets local
gym_cuc <- read.csv("../datasets/gym_members_exercise_tracking.csv")

# Limpieza y transformación de datos
# Convertir variables categóricas a numéricas para análisis
gym_cuc <- gym_cuc %>%
  mutate(
    Workout_Type = as.integer(factor(Workout_Type)),
    Gender = as.integer(factor(Gender))
  )

# 3. Hipótesis a investigar:
# H1: ¿Existe una relación entre la duración del entrenamiento y las calorías quemadas?
# H2: ¿El tipo de ejercicio está relacionado con la frecuencia de entrenamiento?
# H3: ¿El IMC está relacionado con la frecuencia de entrenamiento?

# 4. Estadísticas básicas
# Función para mostrar estadísticas de una variable
mostrar_estadisticas <- function(variable) {
  cat("\nEstadísticas para", deparse(substitute(variable)), ":\n")
  cat("Media:", mean(variable, na.rm = TRUE), "\n")
  cat("Mediana:", median(variable, na.rm = TRUE), "\n")
  cat("Moda:", mfv(variable), "\n")
  cat("Desviación estándar:", sd(variable, na.rm = TRUE), "\n")
}

# Aplicar a variables numéricas importantes
mostrar_estadisticas(gym_cuc$Age)
mostrar_estadisticas(gym_cuc$BMI)
mostrar_estadisticas(gym_cuc$Calories_Burned)
mostrar_estadisticas(gym_cuc$Session_Duration..hours.)

# 5. Correlaciones y gráficos
# Correlación 1: Duración del entrenamiento vs Calorías quemadas
cor1 <- cor(gym_cuc$Session_Duration..hours., gym_cuc$Calories_Burned)
cat("\nCorrelación entre duración y calorías:", cor1, "\n")

ggplot(gym_cuc, aes(x = Session_Duration..hours., y = Calories_Burned)) +
  geom_point(alpha = 0.5, color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Relación entre duración del entrenamiento y calorías quemadas",
       x = "Duración (horas)",
       y = "Calorías quemadas")

# Correlación 2: IMC vs Frecuencia de entrenamiento
cor2 <- cor(gym_cuc$BMI, gym_cuc$Workout_Frequency..days.week.)
cat("\nCorrelación entre IMC y frecuencia de entrenamiento:", cor2, "\n")

ggplot(gym_cuc, aes(x = BMI, y = Workout_Frequency..days.week.)) +
  geom_point(alpha = 0.5, color = "green") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Relación entre IMC y frecuencia de entrenamiento",
       x = "IMC",
       y = "Frecuencia de entrenamiento (días/semana)")

# 6. Identificación de valores atípicos
# Boxplot para IMC
boxplot(gym_cuc$BMI, 
        main = "Distribución del IMC",
        ylab = "IMC",
        col = "lightblue")

# Boxplot para calorías quemadas
boxplot(gym_cuc$Calories_Burned,
        main = "Distribución de calorías quemadas",
        ylab = "Calorías",
        col = "lightgreen")

# 7. Algoritmos de análisis
# Algoritmo 1: Clustering (K-means)
# Preparar datos para clustering
datos_cluster <- gym_cuc %>%
  select(BMI, Calories_Burned, Session_Duration..hours.) %>%
  scale()

# Determinar número óptimo de clusters
fviz_nbclust(datos_cluster, kmeans, method = "wss")

# Aplicar k-means
set.seed(123)
kmeans_result <- kmeans(datos_cluster, centers = 3)
gym_cuc$cluster <- kmeans_result$cluster

# Visualizar clusters
ggplot(gym_cuc, aes(x = BMI, y = Calories_Burned, color = factor(cluster))) +
  geom_point() +
  labs(title = "Clusters basados en IMC y Calorías quemadas",
       x = "IMC",
       y = "Calorías quemadas")

# Algoritmo 2: Regresión lineal
# Modelo de regresión lineal
modelo_rg <- lm(Calories_Burned ~ Session_Duration..hours. + BMI + Age, data = gym_cuc)
summary(modelo_rg)

# Visualización del modelo
ggplot(gym_cuc, aes(x = Session_Duration..hours., y = Calories_Burned)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Modelo de regresión lineal: Calorías quemadas vs Variables predictoras",
       x = "Duración del entrenamiento (horas)",
       y = "Calorías quemadas")

#Se procede a transformar las observaciones tipo character a tipo integer en las columnas de:
#     Gender donde Female=1 y Male=2,
#     Workout_Type donde Cardio=1  HIIT=2  Strength=3  Yoga=4
gym_cuc <- gym_cuc %>%
  mutate(Workout_Type= as.integer(factor(Workout_Type)))
gym_cuc <- gym_cuc %>%
  mutate(Gender= as.integer(factor(Gender)))
print(gym_cuc)

# Crear una variable categórica con etiquetas para el gráfico
gym_cuc$Genero_Etiqueta <- factor(gym_cuc$Gender, levels = c(1, 2), labels = c("Femenino", "Masculino"))

# Gráfico de barras de cantidad de personas por género
ggplot(gym_cuc, aes(x = Genero_Etiqueta)) +
  geom_bar(fill = "skyblue", color = "black") +
  labs(title = "Cantidad de personas por género que asisten al gimnasio",
       x = "Género",
       y = "Cantidad de personas") +
  theme_minimal()



#Obtenga las estadísticas básicas del set de datos: moda, media, mediana.

media <- mean(gym_cuc$Age)
mediana <- median(gym_cuc$Age)
desviacion_estandar <- sd(gym_cuc$Age)

summary(gym_cuc$Age) #con summary obtengo el valor mínimo, el primer cuartil, la mediana, la media, el tercer cuartil el valor máximo, pero falta calcular la moda
summary(gym_cuc$Workout_Type)
summary(gym_cuc$Session_Duration..hours.)
summary(gym_cuc$BMI)
summary(gym_cuc)

moda <- mfv(gym_cuc$Age) #se instla el paquete modeest para utilizar la función mfv el cual me genera la moda, invcar moodest
moda #Edad
moda <- mfv(gym_cuc$Gender)
moda #Género
moda <- mfv(gym_cuc$Weight..kg.) 
moda #Peso kg
moda <- mfv(gym_cuc$Height..m.) 
moda #Estatura m
moda <- mfv(gym_cuc$Max_BPM) 
moda #max_bpm
moda <- mfv(gym_cuc$Avg_BPM) 
moda #avg_bpm
moda <- mfv(gym_cuc$Resting_BPM)
moda #resting_bpm
moda <- mfv(gym_cuc$Session_Duration..hours.) 
moda #duración de sesión horas
moda <- mfv(gym_cuc$Calories_Burned)
moda #calorías quemadas
moda <- mfv(gym_cuc$Workout_Type)
moda #tipo de ejercicio
moda <- mfv(gym_cuc$Fat_Percentage)
moda #porcentaje de grasa
moda <- mfv(gym_cuc$Water_Intake..liters.)
moda #consumo de agua
moda <- mfv(gym_cuc$Workout_Frequency..days.week.)
moda #frecuencia de entrenamiento en días
moda <- mfv(gym_cuc$Experience_Level)
moda #nivel de experiencia
moda <- mfv(gym_cuc$BMI)
moda #IMC



#Ejemplo en moda, los ejercicios tipo Strength son de preferencia, por ejemplo ayuda a determinar adquirir mayor
#cantidad de maqinas y pesos, ampliar el espacio físico de gimnasio
#Adicionalmente, los adultos 43 años son los que más asisten al gimnasio


#Ejercicio de correlacion **Andrey**



#Identifique los valores atípicos(outliers) por medio del grafico Box Plot, explique su análisis.

boxplot(gym_cuc$BMI, main = "Gráfico de los valores atípicos - Indice de masa corporal", horizontal = FALSE) #BMI o IMC

boxplot(gym_cuc$Calories_Burned, main = "Gráfico de los valores atípicos - Calorías quemadas", horizontal = FALSE) #Muestra los valores atípicos de las "Calorías quemadas"
summary(gym_cuc)



#Aplique 2 algoritmos: no supervisado clustering y cualquier otro a escogencia visto en clase para encontrar algún patrón
#y/o predicción entre los datos. Explique su análisis


#Aplicación del algoritmo regresión lineal simple con las variables Calories_Burned y Session_Duration..hours
modelo_rg <- lm(Calories_Burned ~ Session_Duration..hours., data = gym_cuc) #lo que pretende el modelo es encontrar una relación entre el la quema de calorías y el tiempo en horas que dura la sesión de entranamiento.
summary(modelo_rg)  # Corregido: summary del modelo, no del dataset

# Gráfico de regresión lineal corregido
ggplot(gym_cuc, aes(x = Session_Duration..hours., y = Calories_Burned)) + 
  geom_point(alpha = 0.3, color = "green") + 
  geom_smooth(method = "lm", color = "red", se = TRUE) + 
  labs(title = "Regresión lineal de la duración en horas de sesión y las calorías quemadas",  
       x = "Duración en horas sesión", 
       y = "Calorías quemadas")