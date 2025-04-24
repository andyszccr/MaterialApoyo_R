# Cargar las librerías necesarias
library(tidyverse)
library(ggplot2)
library(boot)
library(car)
library(QuantPsyc)
library(NbClust)
library(factoextra)
library(mvtnorm)
library(dendextend)
library(dplyr)
library(plotly)
library(mice)
library(gapminder)
library(rpart)
library(aplpack)
library(corrplot)
library(sm)
library(modeest)  # Para la función mfv

# 1. Cargar y preparar los datos
url <- "https://raw.githubusercontent.com/andyszccr/MaterialApoyo_R/main/05%20Proyecto%20final/gym_members_exercise_tracking.csv"
gym_cuc <- read.csv(url)

# 2. Limpieza y transformación de datos
gym_cuc <- gym_cuc %>%
  mutate(Workout_Type = as.integer(factor(Workout_Type)),
         Gender = as.integer(factor(Gender)))

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

