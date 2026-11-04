rm(list = ls())

#Detalle de librerias a utilzar
install.packages(c("rpart","aplpack","corrplot","sm"),dependencies = TRUE)

library(rpart)
library(aplpack)
library(corrplot)
library(sm)

install.packages(c("dplyr","ggplot2"), dependencies = TRUE)


#Parametro para ajustar que se puedan ver 2 graficos en la misma salida
par(mfrow =c(1,1))

###Las principales funciones para graficos de manera basica que tiene R son los siguientes:###
#plot()
#dotchar()
#histogram()
#density()
#boxplot()
#qqplot()




# ********************** ejemplos con plot ******************************
#plot de todo el dataframe
summary(mtcars)

x11()
plot(mtcars)

#Generacion de una matriz de correlacion por cada variable
#corelacion = técnica estadística que nos indica si dos variables están relacionadas o no.
#Existen dos tipos principales de correlación, la correlación positiva y la correlación negativa
#correlación positiva = cuando una variable aumenta, la otra tambien aumenta. Ejemplo Ventas de helado y temperatura.
#correlación negativa = cuando una variable aumenta, la otra tiende a disminuir. Ejemplo: velocidad y el tiempo de viaje

corrMat <- cor(mtcars)
corrplot(corrMat,method="circle")


#plot de una variable en relacion a otra
plot(x=mtcars$wt, y=mtcars$hp)


#plot con ajuste de titulos
plot(x=mtcars$wt, y=mtcars$hp,xlab = "Desplazamiento",
     ylab = "Caballos Fuerza")

#plot con ajuste de titulos y cambio color de los puntos
plot(x=mtcars$mpg,
     y=mtcars$hp,xlab = "Desplazamiento",
     ylab = "Caballos Fuerza",col="red")


#plot con ajuste por modelo lineal
#El modelo lineal o modelo de regresión lineal estudia la relación entre dos o más variables cuantitativas. 
#Esta metodología es ampliamente usada en problemas de economía, de la industria y de ciencias en general.
#Ejemplo: https://keyrus.com/sp/es/insights/machine-learning-y-sus-modelos-lineales-for-dummies

z <- lm(mtcars$mpg ~ mtcars$hp)
plot(mpg ~ hp,data = mtcars, xlab="Millas x Galon"
     ylab = "Caballos Fuerza", col="red")
abline(z) 


#******************** Ejemplos con dotchar() **********************
# Simple Dotplot = diagrama de puntos
# Ejemplo: https://r-coder.com/grafico-puntos-r/
dotchart(mtcars$mpg,labels=row.names(mtcars),cex =.7,
         main="Gas Milage for Car Models",
         xlab="Miles Per Gallon")


x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,labels=row.names(x),cex=.7,groups= x$cyl,
         main="Gas Milage for Car Models\ngrouped by cylinder",
         xlab="Miles Per Gallon", gcolor="black", color=x$color) 


##******************* Ejemplos con histogram ***********************
#Un histograma es un gráfico de barras que representa la frecuencia de un valor estadístico dentro de un grupo o población de estudio
# como leer un histograma: https://es.khanacademy.org/math/cc-sixth-grade-math/cc-6th-data-statistics/histograms/v/interpreting-histograms
hist(mtcars$hp)

hist(mtcars$hp, breaks = 6)
hist(mtcars$hp, breaks = 15)

hist(mtcars$hp, xlab="Horse Power")

hist(mtcars$hp, xlab="Horse Power",
     main = "Detalle de Vehiculos por HP", col="lightblue")


#******************** Ejemplos con density *****************************
#density() =  Un gráfico de densidad es una representación visual de la distribución de datos a lo largo de un intervalo continuo o período de tiempo.(probabilidad de la variable)
# https://datavizcatalogue.com/ES/metodos/grafico_de_densidad.html#:~:text=Un%20gr%C3%A1fico%20de%20densidad%20visualiza,suaves%20al%20suavizar%20el%20ruido.
# Ejemplos: https://www.geeksforgeeks.org/histograms-and-density-plots-in-r/


d <- density(mtcars$mpg)
plot(d, col = "blue")


d <- density(mtcars$mpg)
plot(d, main = "Millas por Galon")
polygon(d, col = "pink", border="blue")


#******************** Ejemplos con boxplot *****************************
# boxplot: muestra la distribución cuantitativa de los datos de una manera que facilita la comparación entre las variables, o a través de los niveles categóricos de las variables.
#Ejemplo: https://r-coder.com/boxplot-en-r/


boxplot(mtcars$mpg, main = "Hist Miles per Hour", horizontal = FALSE)
hist(mtcars$mpg, main = "Hist Miles per Hour")


boxplot(hp ~ cyl, data = mtcars)
title("Relacion de Dist de HP por Cilindros")

boxplot(hp ~ cyl, data = mtcars,col = "lightblue")
title("Relacion de Dist de HP por Cilindros")



#Practica de DV con ggplot2
#******************** Ejemplos con ggplot2 *****************************
#*
library(ggplot2)

mtcars
str(mtcars)

#Grafico base
plot(mtcars$wt ~ mtcars$mpg)

#Grafico inicial de peso y millas por galon
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() 



#Grafico base
hist(mtcars$wt)

#Grafico de histogram vs ggplot2 geom_histogram
ggplot(mtcars, aes(x=wt)) +
  geom_histogram(bins = 5)

#Colores en ggplot2: https://r-graph-gallery.com/ggplot2-color.html
ggplot(mtcars, aes(x=wt, fill = I("pink"), col = I("steelblue"))) +
  geom_histogram(bins = 5)

ggplot(mtcars, aes(x=wt)) +
  geom_histogram(bins = 5,fill="green",col = "black") +
  ggtitle("Detalle de vehiculos por peso") + 
  xlab("peso") +
  ylab("total")


#  geom_point()
class(mtcars$wt)
class(mtcars$mpg)
class(mtcars$disp)

class(mtcars$am)
table(factor(mtcars$am))


# geom_point 3 variables
ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
  geom_point()


#  geom_point() 4 variables
ggplot(mtcars, aes(x = wt, y = mpg, size = hp, color = disp)) +
  geom_point()

# geom_point() 5 variables
ggplot(mtcars, aes(x = wt, y = mpg, size = disp, color = disp, shape = factor(cyl))) +
  geom_point()


ggplot(mtcars,aes(x=mpg,y=qsec,col=factor(cyl),shape=factor(am))) +
  geom_point()

# Agregar un ajuste por (hp/wt) al size
ggplot(mtcars,aes(x=mpg,y=qsec,col=factor(cyl),shape=factor(am),size=(hp/wt))) +
  geom_point()

#********* Error ***********
#Ejecute la siguiente instruccion e indique cual es el problema?
ggplot(mtcars, aes(x = wt, y = mpg, shape = disp)) +
  geom_point()


class(mtcars$disp)
summary(mtcars$disp)

# TAREA #5

# 1 - Genere un grafico de puntos con  mpg en eje x y cyl en eje y

ggplot(mtcars, aes(x = mpg, y = cyl)) +
  geom_point()

# 2 - Reinvierta los valores: con cyl en eje x y mpg en eje y
ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point() +
  ggtitle("cyl en eje X y mpg en eje Y")

# 3 - Genere un grafico con wt en eje x, mpg en eje y con cyl como color 

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  ggtitle("Relación entre wt y mpg, coloreado por cyl") +
  xlab("Peso del vehículo (wt)") +
  ylab("Millas por galón (mpg)")


# 4 - Cambie shape y size en los puntos del grafico anterior y agregue en geom_point() 
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(shape = 16, size = 3)


#Modelo lineal generico
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method="lm")

#Modelo lineal generico
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()+
  geom_smooth(method="lm",se=FALSE)

#Modelo lineal por cada cyl y un lm general del dataset
ggplot(mtcars, aes(x = wt, y = mpg, shape = factor(am), col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F) +
  stat_smooth(method = "lm", se = F,aes(group=1))



# Tarea #5
# 5 Ejecute el codigo a continuacion y resuelva las siguientes preguntas
#A partir del siguiente grafico
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

#5.1 - Copia y pega el codigo de la primera grafica. 

ggplot(mtcars, aes(x = mpg, y = cyl, fill = factor(cyl))) +
  geom_point(shape = 21)

#Cambiar la estetica para que cyl por "fill" en lugar de "col".


#5.2 - Copia y pega el codigo de la segunda grafica. En geom_point () 

ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point(shape = 21, alpha = 0.6)

#cambie el argumento shape a 21 y agregue un argumento "alpha" establecido en 0.6.
#5.3 - Copia y pega el codigo del tercer grafico. En la estetica ggplot (), map am para col.

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(am))) +
  geom_point()


#Grafico inicial
ggplot(mtcars,aes(x=wt,y=mpg,col=cyl)) + 
  geom_point()


#Definicion de color
my_color <- "#4ABEFF"
ggplot(mtcars,aes(x=wt,y=mpg,col=cyl)) + 
  geom_point(col=my_color)

#Ajuste por tamano, forma y color
ggplot(mtcars,aes(x=wt,y=mpg,fill=cyl)) + 
  geom_point(col=my_color,size=4,shape=23)


