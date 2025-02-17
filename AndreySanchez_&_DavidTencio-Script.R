#-------------------------------------------------------------------------------------------

#Vectores

#-------------------------------------------------------------------------------------------

#1.Declare un vector de notas de un estudiante, nombrado notasEstudiante con los siguientes
#valores:
# 90.5, 80.0, 75.0, 65.5, 75.5, 82.0, 99.5, 89.0, 83.6, 76.5 

notasEstudiante<-c(90.5,80.0,75.0,65.5,75.5,82.0,99.5,89.0,83.6,76.5)

#2. Declare un vector con los siguientes valores y nombrarlo vectorMaterias:
#  “Matematica”, “Espanol”, “Ingles”, “Frances”, “Folosofia”, “Tecnologia”, “Fisica”,
#“Biologia”, “Sociales”, “Quimica” 


vectorMaterias<-c("Matematica","Espanol","Ingles","Frances","Folosofia","Tecnologia","Fisica","Biologia","Sociales","Quimica")

#3. Asigne los nombres vectorMaterias al vector notasEstudiante e imprima el resultado.

names(notasEstudiante)<-vectorMaterias

#4. Muestre el tamaño del vector e imprima el resultado.

length(notasEstudiante)

#*

#5. Obtenga el promedio de las notas del estudiante en variable promedioNotas e imprima el
#resultado.
promedioNotas<-mean(notasEstudiante)



#6. Muestre la nota de la materia "Ingles" del estudiante.
notasEstudiante["Ingles"]


#7. Obtenga la nota mínima y máxima del vector, declare dos variables e imprimirla el resultado. 
notaminima<-min(notasEstudiante)
notamaxima<-max(notasEstudiante)
#-------------------------------------------------------------------------------------------

#Matrices

#-------------------------------------------------------------------------------------------

#8.Construya una matriz en R, empleando la función matrix con el parámetro nrow, que construya por columnas la matriz de la siguiente manera: 

numbers<-c(12,45,78,90,34,56)
numbers_matriz<-matrix(numbers,byrow=TRUE,nrow=2)

#9.Sume la matriz anterior con la función sum () e imprima el resultado con la función cat.
suma_matriz<-sum(numbers_matriz<-matrix(numbers,byrow=TRUE,nrow=2))
cat(suma_matriz)

#10. Obtenga el promedio de la matriz del punto 1 e imprima el resultado con la función cat.
mean(numbers_matriz)

#11. Sume las columnas de la matriz del punto 1 e imprima el resultado con la función cat.
suma_columnas <-colSums(numbers_matriz)
cat(suma_columnas)



#12. Sume las filas de la matriz del punto 1 e imprima el resultado con la función cat.
suma_fila_1<-sum(numbers_matriz[1,])
suma_fila_2<-sum(numbers_matriz[2,])
cat(suma_fila_1,suma_fila_2)

suma_filas<-rowSums(numbers_matriz)
cat(suma_filas)

#13. Añada la suma de las columnas a la matriz del punto 1 e imprima el resultado con la función cat.

numbers_matriznuevo <- cbind(numbers_matriz, suma_filas)#nuevo vector suma filas
numbers_matriznuevo
cat(numbers_matriznuevo)


#Cree la siguiente matriz del medallero de juegos nacionales 2023:
datos_juegosNacionales<-matrix(c(23,12,13,48,12,2,1,15,10,7,11,28,8,7,9,24,8,3,4,15,7,7,5,19,7,7,2,16,5,4,6,15),byrow= TRUE ,nrow=8)

#Cree los siguientes vectores:
cuadroMedallero <- c("Oro", "Plata", "Bronce", "Total")
comiteCantonal <- c("San José","Escazú", "Alajuela","SantaCruz","Oreamuno","Limon","Grecia","San Ramón")

#14. Asigne nombres a las columnas de la matrix datos_juegosNacionales, use el vector cuadroMedallero 
colnames(datos_juegosNacionales)<-cuadroMedallero

#15. Asigne nombres a las filas de la matrix datos_juegosNacionales, use el vector comiteCantonal
rownames(datos_juegosNacionales)<-comiteCantonal

#16. Muestre los datos del cantón Oreamuno
print(datos_juegosNacionales[5,])

#17. Muestre el cantón que tiene menos medallas de plata e imprima el resultado. (Puede mostrar la fila, la posición de la matriz o el nombre del cantón) 
print(min(datos_juegosNacionales[1:8,2]))



#-------------------------------------------------------------------------------------------

#Factores

#-------------------------------------------------------------------------------------------
#18. Cree un factor con el nivel de géneros musicales:
#  ("rock", "pop", "jazz", "salsa", "merengue", "pop ", " rock", "regueton", "jazz ", "salsa")

generos_musicales<- c("rock","pop","jazz","salsa","merengue","pop","rock","regueton","jazz","salsa")

#19. Cree el factor ordenado con el nivel de género musical.
genero_musicalOrdenado <-factor(generos_musicales,ordered = TRUE,levels = c("jazz","merengue","regueton","rock","pop","salsa"))

#20. Muestre el resultado o summary del factor. 
summary(genero_musicalOrdenado)
#-------------------------------------------------------------------------------------------