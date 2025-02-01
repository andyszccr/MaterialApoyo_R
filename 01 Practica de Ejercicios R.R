#Calculadorq en R
#Suma 
5+5

#Resta
5-5

#multiplicacion
5*5

#division
(5+5)/2

#Potencia
5^2

#modulo 
28%%6
#
#Declariarcion de variables 

var_numerico<-42

nombre<-'Andrey'
nombre2<-"luis" # solo uno

#Verifica el tipo de variable 
class(nombre)

#Declaracion de Vectores 
ventas_lapices<-c(140,98,121,201,213)
ventas_cuadernos<-c(118,73,88,101,99)

lapices<-c('Lunes','Martes','Miercoles','Jueves','Viernes')
lapices2<-c("Lunes","Martes","Miercoles","Jueves","Viernes")

#Asignar un vector de otro
names(ventas_lapices)<-lapices
ventas_lapices


#asigna 
names(ventas_cuadernos)<-lapices2
ventas_cuadernos

sum(ventas_cuadernos)
sum(ventas_lapices)

#Suma el total del los vectores
totalsemana<-sum(ventas_cuadernos+ventas_lapices)
totalsemana

totalseman2<-sum(ventas_cuadernos)+sum(ventas_lapices)
totalseman2


#calcular la ganancia de dia miercoles 
ventas_cuadernos[3]

ventas_lapices[3]



ventas_cuadernos["Miercoles"]

ventas_lapices['Miercoles']

# generar de lunes a miercoles 
media_semana <- ventas_cuadernos[1:3]
media_semana
sum(media_semana)



media_semana2 <- ventas_lapices[c("Lunes","Martes","Miercoles")]
media_semana2
sum(media_semana2)

sum(media_semana+media_semana2)

# nos sirve para mostrar el promedio

mean(media_semana2)
mean(media_semana)

ventas_cuadernosbajos<-ventas_cuadernos<100
ventas_cuadernosbajos

#vectornuevo<-ventas_cuadernos[ventas_cuadernosbajos]

#----------------------------------------------------------------------------------
#Crear un vector con los siguientes valores y nombrarlo vectorA: 1.2,3.4,5,8,9.1,11.2,4.2,3.6
#Crear un vector con las sigiuentes valores y nombrarlo vectorB: 3,5,8,11,13,15,8,3
#Sume ambos ventores e imprima el resultado
#Combine ambos vectores y mantengalo en una variable vector_total
#Con el vector total multipliquelo por 2 y sumale 100
#Con la instruccion anterior calcule la raiz cuadrada mantengalo en la variable "raiz_total" sqrt()

  
vectorA<-c(1.2,3.4,5,8,9.1,11.2,4.2,3.6) # asigancion del Vector A
vectorB<-c(3,5,8,11,13,15,8,3)# asignacion del vector B
#sum(vectorA+vectorB)

vector_total<- c(vectorA,vectorB)
vector_total2<-sum(vector_total) # Suma 
Vector_multiplicado<-(vector_total*2)+100
raiz_total<-sqrt(Vector_multiplicado)
#----------------------------------------------------------------------------------
# Si esta en true lo lleno por columna
# si esta falase lo llena po columna
#----------------------------------------------------------------------------------
matrix(1:9,byrow=TRUE,nrow=3)


ventas_lapices <- c(460.998, 314.4)
ventas_cuadernos <- c(290.475, 247.900)
ventas_libros <- c(309.306, 165.8)
ventas_oficina <- c(ventas_lapices, ventas_cuadernos, ventas_libros)
oficina_matrix <- matrix(ventas_oficina, byrow=TRUE, nrow=3)

tiendas <- c("Libreria SJ","Libreria HE")

tiendas <- c("Libreria SJ","Libreria HE")
lineas_articulos <- c("Lapices","Cuadernos","Libros")
colnames(oficina_matrix) <- tiendas
rownames(oficina_matrix) <- lineas_articulos
oficina_matrix



