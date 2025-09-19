# ==============================================================================
# SCRIPT: Ejercicios Básicos de R - Fundamentos del Lenguaje
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script contiene ejercicios básicos para aprender los 
#              fundamentos del lenguaje de programación R, incluyendo operaciones
#              aritméticas, variables, vectores, matrices y factores.
# ==============================================================================

# ==============================================================================
# SECCIÓN 1: OPERACIONES ARITMÉTICAS BÁSICAS
# ==============================================================================

# Suma básica
5 + 5

# Resta básica
5 - 5

# Multiplicación básica
5 * 5

# División con paréntesis para orden de operaciones
(5 + 5) / 2

# Potencia (elevar a un exponente)
5^2

# Módulo (resto de la división)
28 %% 6

# ==============================================================================
# SECCIÓN 2: DECLARACIÓN Y MANEJO DE VARIABLES
# ============================================================================== 

# Declaración de variable numérica
var_numerico <- 42

# Declaración de variables de texto (strings)
# Se puede usar comillas simples o dobles
nombre <- 'Andrey'
nombre2 <- "luis"  # Ambas sintaxis son válidas

# Verificar el tipo de variable usando class()
class(nombre)

# ==============================================================================
# SECCIÓN 3: TRABAJO CON VECTORES
# ============================================================================== 
# Crear vectores numéricos con datos de ventas
ventas_lapices <- c(140, 98, 121, 201, 213)
ventas_cuadernos <- c(118, 73, 88, 101, 99)

# Crear vectores de texto con nombres de días
lapices <- c('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes')
lapices2 <- c("Lunes", "Martes", "Miercoles", "Jueves", "Viernes")

# Asignar nombres a los vectores usando names()
names(ventas_lapices) <- lapices
ventas_lapices

# Asignar nombres al segundo vector
names(ventas_cuadernos) <- lapices2
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
# colocarle el nombre a las columnas
colnames(oficina_matrix) <- tiendas
#colcoar nombres a las filas
rownames(oficina_matrix) <- lineas_articulos
oficina_matrix

# funcion para sumar la matriz.
suma_filas<-rowSums(oficina_matrix)

#sumar las columnas
suma_columnas <-colSums(oficina_matrix)

#------------------------------------------------------
# funcion cbind 
# agregar columnas a la matriz 

new_oficinamatrix<- cbind(oficina_matrix,suma_filas)
# rbind para agregar fila a la matriz
new_oficinamatrix<- rbind(new_oficinamatrix,suma_columnas)

print(oficina_matrix)
print(sum(oficina_matrix[,"Libreria HE"]))

print(colSums(oficina_matrix[,"Libreria HE"]))


oficina_matrix[3,1]
oficina_matrix["Libros","Libreria SJ"]
oficina_matrix["Lapices",]

#mostrar fila 3 y columna 2
sum(oficina_matrix["Libros","Libreria HE"])

print(oficina_matrix[1,1:2])
print(oficina_matrix[1,1:2])

#limpiar los datos
#rm()


genero_vector <- c("Male", "Female", "Female", "Male", "Male")
estadocivil_status <- c("Single","Married","Divorced","Single","Single","Single","Married")
factor_genero_vector <- factor(genero_vector)
factor_estadocivil_status <- factor(estadocivil_status)

#summary -> valor del genero vector 
summary(factor_genero_vector)
summary(factor_estadocivil_status)
#categorizar no es numero

#Construir valores con los niveles.
genero_vector <- c("M", "F", "F", "M", "M")
factor_genero_vector <- factor(genero_vector) 

#recibe por parametro 
levels(factor_genero_vector)<-c("Femenino", "Masculino")
factor_genero_vector

speed <-c("fast","slow","slow","fast","insane")
speed_vector<-factor(speed,ordered = TRUE,levels = c("slow","fast","insane"))

summary(genero_vector)
summary(factor_genero_vector)
#-------------------
# puedes combinar cualquier cantidad de datos.
# puedo gran cantidad de datos como una base de datos
# en vez columnas -> variables o atributos
# en vez de filas -> observaciones 
# esversatil
# Buscando un set de datos -> aviacion
#----------------------------------------------------------











