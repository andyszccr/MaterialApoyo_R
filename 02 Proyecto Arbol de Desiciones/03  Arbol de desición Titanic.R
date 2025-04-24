#Instalar paquetes en consola
install.packages("tidyverse")
install.packages('titanic')

#colocar las librerias en el script
# para manipular datos 
# realizar operaciones como filtrado, agrupacion
library(tidyverse)
library(titanic)

#Cargar libreria de datos
data("titanic_train")
#Teclear la funcion para ser mostrados en consola de forma ordenada.
head(titanic_train)

#cargar librerias por clasficacion para hacer el arbol
# hacer los calculos
library(rpart)
# se utiliza para la parte grafica
install.packages('rattle')
library(rattle)
# tambien se usa para la parte grafica
install.packages('rpart.plot')
library(rpart.plot)

#Modelado de arbol decision
#no es 100% exacto por un margen de error
arbol<-rpart( 
  #Formula para ver cual pasajer sobrevivio, genero y edad
  formula = Survived ~ Sex + Age,
  #Datos de qonde los voy a extraer
  data = titanic_train,
  #conocer el valor que nos da
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


