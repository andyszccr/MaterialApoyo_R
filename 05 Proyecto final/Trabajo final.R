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
library(ggplot2)
library(plotly) #install.packages("plotly")
library(mice)   #install.packages("mice")
library(gapminder)
library(rpart)
library(aplpack)
library(corrplot)
library(sm)
install.packages(c("rpart","aplpack","corrplot","sm"),dependencies = TRUE)  #instalar esta libreria y luego invocar las libreiras de abajo
library(rpart)
library(aplpack)
library(corrplot)
library(sm)
install.packages(c("dplyr","ggplot2"), dependencies = TRUE) #instalar






#Se nombra el data set como gym_cuc
gym_cuc <- gym_members_exercise_tracking

#Se procede a transformar las observaciones tipo character a tipo integer en las columnas de:
#     Gender donde Female=1 y Male=2,
#     Workout_Type donde Cardio=1  HIIT=2  Strength=3  Yoga=4
gym_cuc <- gym_cuc %>%
  mutate(Workout_Type= as.integer(factor(Workout_Type)))
gym_cuc <- gym_cuc %>%
  mutate(Gender= as.integer(factor(Gender)))
print(gym_cuc)




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
summary(gym_cuc)
ggplot(gym_cuc, aes(x = Session_Duration..hours., y = Calories_Burned)) + geom_point(alpha = 0.3, color = "green") + geom_smooth(method = "lm", color = "red", se = TRUE) +  labs(title = "Regresión lineal de la duración en horas de sesión y las calorías quemadas",  x = "Duración en horas sesión", y = "Calorías quemadas")








