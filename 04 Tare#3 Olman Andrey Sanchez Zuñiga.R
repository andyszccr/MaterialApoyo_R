#pARA leer el documento en sc
#BikeData2<-read.csv("BikeData.csv")
BikeData <- read.csv("D:\\Andrey\\06 CUC\\01 Mineria de Datos\\BikeData.csv")

#1. Que edad tiene el 7mo corredor en el dataset?
SeptimoCorredor <- BikeData[7, "age"]
cat("La edad del setimo corredor",SeptimoCorredor)

#2 Cuantos de los primeros 10 corredores salen diariamente?
personas_Diarias <- BikeData[BikeData$cyc_freq=='Daily',]
primeros_10 <- head(personas_Diarias,10)

#3Cual es la velocidad promedio de la primera corredora mujer?
corredores <- BikeData[BikeData$gender=='M',]
Primera_corredora<-head(corredores,1)
promedio<-mean(Primera_corredora$speed)
cat("el promedio de la primera corredora",promedio)

#Que tipo de variable es student?
str(BikeData$student)

#Indique que genera la siguiente instruccion? 
table(BikeData$employed)

test <- BikeData[,7]

#Cree nuevo dataframe con todos los valores de distancias
distancias_df <- data.frame(distance = BikeData$distance)

print(distancias_df)
#Un vector con todos los valores de distancias
distancias_vector <- BikeData$distance
print(distancias_vector)


#Crear un Dataframe con todos los ciclistas que estan empleados
ciclistas_empleados <- BikeData[BikeData$employed == 1, ]


# Extraer las distancias de los ciclistas empleados
distancias_empleados <- ciclistas_empleados$distance

# Mostrar el vector
print(distancias_empleados)


# Filtrar ciclistas que son estudiantes
estudiantes <- BikeData[BikeData$student == 1, ]

# Calcular la distancia promedio
distancia_promedio_estudiantes <- mean(estudiantes$distance, na.rm = TRUE)


# Contar cuántas personas usan la bicicleta diariamente
uso_diario <- sum(BikeData$cyc_freq == "Daily")

#-----------------------------------------------------------
# Filtrar personas que usan la bicicleta diariamente
diarios <- BikeData[BikeData$cyc_freq == "Daily", ]

# Contar cuántos de ellos son hombres
hombres_diarios <- sum(diarios$gender == "M")
#-----------------------------------------------------------
# Filtrar mujeres que usan la bicicleta diariamente
mujeres_diarias <- BikeData[BikeData$cyc_freq == "Daily" & 
                              BikeData$gender == "F", ]

# Calcular la edad promedio
edad_promedio_mujeres_diarias <- mean(mujeres_diarias$age, 
                                      na.rm = TRUE)
