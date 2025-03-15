#limpiar datos
rm(list = ls())

#***************** Practica con Operadores *************************
#ejecutar este codigo previo al inicio de los ejercicios 
empleados <- c("empleado_1","empleado_2","empleado_3","empleado_4","empleado_5","empleado_6","empleado_7","empleado_8","empleado_9","empleado_10")
valores <- sample.int(70,n=50,replace = TRUE)
matriz <- matrix(valores, byrow = TRUE, nrow=10)
salarios <- data.frame(empleados,matriz)
columnas_etiquetas <- c("Empleado","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")
colnames(salarios) <- columnas_etiquetas


# Vectores linkedin y facebook 

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
dias <- c("Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Domingo")
names(linkedin) <- dias
names(facebook) <- dias

#1-Cuales de las observaciones en linkedin son mayores a 15?
#2-Cuales de las observaciones en facebook son menores a 10?
#3-Que es mas popular linkedin o facebook
#4-Que dia tuvo 14 vistas en linkedin?

#1
linkedin > 15
linkedin[linkedin > 15]

#2
facebook <= 10
facebook[facebook <= 10]

#3
linkedin > facebook

#4
linkedin == 14
linkedin[linkedin==14]



#Operadores logicos   "&" y "|"

#Asigne a una variable "miercoles" las vistas en linkedin
#5-Estan las vistas del miercoles entre 12 y 20 
#6-Estan las vistas de miercoles menores a 10 o mayores a 18
#7-Cuando el perfil de linkedin tuvo menos de 11 visualizaciones y el de facebook mas de 15
#8-Cuando alguno de los perfiles tuvieron mas de 13 visualizaciones


miercoles <- linkedin["Miercoles"]
miercoles

#5
miercoles > 12 & miercoles < 20

#6
miercoles < 10 | miercoles > 18

#7
linkedin < 11 & facebook > 15

#Tarea operadores logicos
#8  



#Use el dataframe de salarios creado al inicio
#9-Seleccione los valores del dia martes
#10-Busque los extremos menores a 7 y mayores a 42 (bajos salarios y altos salarios)
#11-Indique el total de salarios que encontro como extremos

#9
salarios_martes <- salarios[,3]
salarios_martes


#TAREA operadores logicos

#10


#11




#*********************** Creacion de Condiciones **************************
### Condicion If y If else

redsocial <- "Facebook"
if (redsocial=="Facebook"){
  print("Esta usando Facebook")
}

vistas <- 21
if (vistas > 20){
  print("Tu perfil es muy visitado")
}

vistas <- 10
if (vistas > 20){
  print("Tu perfil es muy visitado")
}else{
  print("Tu perfil no es muy visitado")
}

if (vistas > 20){
  print("Tu eres muy buscado")
}else if(vistas > 10 & vistas <=20){
  print("Tu perfil es muy visitado")
}else{
  print("Tu perfil es poco visitado")
}


#Construya la siguiente condicion
avg_link <- 10
avg_fb <- 16

# 13- De acuerdo a los siguientes valores realice la siguiente seleccion
#     Si ambos valores son mayores a 15 multiplique la suma de ambos por 2
#     Si ambos valores son menores a 10 multiplique la suma de ambos por 0.5
#     Los otros casos el valor resultante sera unicamente la suma de ambos
#     Imprima el resultado calculado en una variable de nombre avg_suma


#Tarea condiciones
#13




###************ Detalle de ciclos  While


velocidad <- 64

while (velocidad > 30) {
  print('mas despacio!')
  velocidad <- velocidad - 7
  velocidad
}

# Impresion variable
velocidad


velocidad <- 64
while (velocidad > 30) {
  print(paste("Su velocidad es:",velocidad))
  if (velocidad > 48 ) {
    print('Disminuya seriamente su velocidad!')
    velocidad <- velocidad - 11  
  } else {
    print('Disminuya su velocidad!')
    velocidad <- velocidad - 6
  }
}


#TAREA CICLO WHILE
#Construya un ciclo que imprima los valores de 1 a 10
#Crearlo con una variable de nombre i

#Ajuste el ciclo anterior y multiplique cada valor de i en el ciclo y multipliquelo por 3
#Si el valor es divisible por 8 salir del ciclo(Usar break)




###************* Ciclo Loop
primes <- c(2, 3, 5, 7, 11, 13)

# loop version 1
for (p in primes) {
  print(p)
}

# loop version 2
for (i in 1:length(primes)) {
  print(primes[i])
}


linkedin <- c(16, 9, 13, 5, 2, 17, 14)

for (li in linkedin) {
  if (li > 10 ) {
    print("Usted es muy popular!")
  } else {
    print("Necesita ser mas visible!")
  }
  print(li)
}


#TAREA CICLO FOR
#Construya un ciclo que cuente las r y cuando encuentre una u en frase salga del ciclo

rquote <- "Estar siempre rodeado de ustedes"
chars <- strsplit(rquote, split = "")[[1]]



##*********** Funciones

?mean()
args(mean)


#Media de cada vector
avg_fb <- mean(facebook)
avg_link <- mean(linkedin)


#Media de ambos vectores
avg_sum <- mean(c(linkedin,facebook))
avg_sum_trimmed <- mean(c(linkedin,facebook), trim=0.3)

avg_sum
avg_sum_trimmed

#Calcule la suma de los valores de ambos vectores por dia
linkedin + facebook

#Vector con valores nulos
vector_valores <- c(17,NA,5,16,8,13,14)
mean(vector_valores)
mean(vector_valores,0,na.rm = TRUE)


# Funcion Exponencial
pow_two <- function(x){
  x <- x^2
  return(x) 
}

val <- pow_two(4)
print(val) 


interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

interpret(linkedin[1])
interpret(facebook[2])



####*********Codigo para instalar y cargar librerias

#install.packages()
#libray()


###********* Funciones lapply

pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split_math <- strsplit(pioneers, split = ":")
split_math

split_low <- lapply(split_math,tolower)
str(split_low)



#Combinar una funcion propia con una funcion sistema usando lapply
select_first <- function(x) {
  x[1]
}
# Aplicar select_first() sobre nombres
nombres <- lapply(split_low,select_first)
nombres


#Funcion anterior mejorada
select_el <- function(x, index) {
  x[index]
}

# Ajsute en el llamado
names <- lapply(split_low,select_el,index=1)
years <- lapply(split_low,select_el,index=2)

names
years


# Definition of character strings representing times
str1 <- "2024-7-01 14:23:08"

# Convert the strings to POSIXct objects: time
time1 <- as.POSIXct(str1, format = "%Y-%m-%d %H:%M:%S")


format(time1,"%M")




#####DPLYR######################
rm(list = ls())

#Librerias a utilizar
#formaro de fechas
install.packages(c("tidyr","lubridate"),dependencies = TRUE)
#Serie de funciones en R
install.packages("dplyr",dependencies = TRUE)
install.packages("openintro",dependencies = TRUE)


library(dplyr)
library(openintro)
library(tidyr)
library(lubridate)


#Practica con dplyr
#La informacion sobre la libreria dplyr esta en la siguiente ruta https://cran.r-project.org/web/packages/dplyr/dplyr.pdf
#Dentro de las principales 5 funciones que tiene dplyr son las siguientes y en la practica vamos a ir trabajando con cada una.

#select()
#filter()
#arrange()
#mutate()
#summarise()


mtcars
str(mtcars)

mtcars
glimpse(mtcars)

#Casos usando "select()"
#Ejemplo 1  select(df,col1,col2,col3)
select(mtcars,mpg,cyl,disp)

#Ejemplo 2  select(df,col1:col7,-col3)
select(mtcars,mpg:qsec)

select(mtcars,mpg:qsec,-cyl)

#Ejemplo 3 select() starts_with
select(mtcars, starts_with('c'))

#Ejemplo 4 select() ends_with
select(mtcars, ends_with('yl'))

#Ejemplo 5 select() contains
select(mtcars, contains('ar'))

#Ejemplo 5 select() contains
select(mtcars,one_of('cyl','wt'))


head(mlb)

#Practica sacar todas las columnas de MLB
select(mlb,1:4)

#Extraer unicamente las columnas player y salario
select(mlb,one_of('player','salary'))

#Seleccione unicamente las columnas que inician con p
select(mlb, starts_with("p"))



#Casos usando filters
#Ejemplo 1 Filtrar todos los vehiculos que realizan mas de 25 mpg
filter(mtcars, mpg > 25)

#Ejemplo 2 Filtrar todos los vehiculos que son de 8 cilindros y qsec mayor a 16
filter(mtcars, cyl == 8, qsec > 16)
filter(mtcars, cyl == 8 & qsec > 16)



#slice
#la funcion slice sirve para poder extraer registros especificos de un df
slice(mtcars,1:5)

slice(mtcars,c(1:5,11:16))


#arrange
#Extraer el header de los registros ordenados por hp
head(arrange(mtcars,hp))

head(arrange(mtcars,wt))

#Extraer el header de los registros ordenados por hp de manera descendente 
head(arrange(mtcars,desc(hp)))

#Ordenar los registros mediante cilindros(cyl) y millas por galon(mpg)
arrange(mtcars, cyl, mpg)

#Ordenar los registros de manera descendente en 2 columnas
head(arrange(mtcars, desc(cyl), desc(mpg)))

max(mtcars)
#mutate
#Copiar la columna con un nuevo nombre
mutate(mtcars,horsepw = hp)

#Ejecutar una multiplicacion o funcion sobre la columna
mutate(mtcars, kmpg = mpg*1.6)

#Ejecutar la suma de 2 columnas en una nueva
mutate(mtcars, suma_col = disp + mpg)

#Ejecturar una division de 2 columnas
mtcars2 <- mutate(mtcars, hp_to_wt = hp/wt)




#summarise
#Ejecutar ciertas funciones sobre el df indicado
#funciones de estaditisca basica
summarise(mtcars, mean_weight = mean(wt), 
          max_milepergallon = max(mpg), 
          min_cylinder = min(cyl))


#Algunos otros comandos importates dentro de dplyr

#glimpse
glimpse(mtcars)


#distinct
distinct(mtcars, cyl)

distinct(mtcars, cyl,am)

#sample_n
sample_n(mtcars,10)



## Encadenando sentencias u operaciones
# Este es una de las grandes virtudes de esta libreria 


#Ejemplo 1
#Cual vehiculo de los que tiene 8 cilindros tiene mas caballos de fuerza
mtcars %>%
  filter(cyl==8) %>%
  summarise(maxhp = max(hp))

#Calcule el promedio de caballos de fuerza (hp) y las mpg, entre los vehiculos de 8 cilindros (cyl)
mtcars %>% 
  filter(cyl==8) %>%
  summarise(meanhp = mean(hp),meanmpg = mean(mpg))

max(select(filter(mtcars, cyl == 8), cyl))


#Calcule  el total de vehiculos por categoria de cilindros (cyl) y ordene la lista de mayor a menor
mtcars %>%
  group_by(cyl) %>%
  summarise(cyl_count=n()) %>%
  arrange(desc(cyl_count))

#Indique el total de millas por galon realizadas en los vehiculos de acuerdo 
#a la cantidad de carburadores
mtcars %>%
  group_by(carb) %>%
  summarise(totalmpg = sum(mpg))



#Calcular el promedio de las mpg para los vehiculos cuyo peso sea mayor a 3.5  
# y agruparlos por cilindos y tipo manual y automatico
mtcars %>% 
  filter(wt > 0.5) %>%
  group_by(cyl, am) %>% 
  summarise(mn = mean(mpg))

