# Clase 7 Manejo de Datos dataframe
####################################

#invocar la data de mtcars
mtcars

#dimension de un data frame
dim(mtcars)

#mostrar los primeros ejercicios
head(mtcars,5)

#ultimos 5  registros
tail(mtcars,5)

#Tipo de valor o clase que es.
#mustra la estructura del datafram
str(mtcars)

#resumen del dataframe
summary(mtcars)

#Crear una tabla 
table(mtcars$cyl) 

mtcars[mtcars$cyl==4,]


# vehiculos que tienen cilindraje 8
mtcars[mtcars$cyl==8,]


#nombrelo los manuales
vehic_manuales<-mtcars[mtcars$am==1,]

#Genere otro con los automaticos nombrelo 
vehic_autom <- mtcars[mtcars$am==0,]



#Indique de los vehiculos manuales  cual tiene más 
max(vehic_manuales,mtcars$hp)

#Indique de los vehiculos manuales  cual tiene más 
vehic_manuales2<-max(vehic_manuales$hp)

max_hp<-max(vehic_manuales[,4])

#Mostrar la informacion de la tabla  que estamos realizando la busqueda.
max_car<-vehic_manuales[vehic_manuales$hp==max_hp,]


# ------------------------------------------------------------
#Que vehiculo automatico realiza más millas por galon max()
vautomatico <- mtcars[mtcars$am==0,]
max_mpg <- max(vehic_manuales,mtcars$mpg)
max_pgCar <- vehic_manuales[vehic_manuales$mpg==max_mpg]
  
max_mpg<-max(vehic_autom$mpg)

maxlg<-vehic_autom[vehic_autom$mpg==max_mpg,]
# ---------------------------------------------------------
#Data Driving

#Que vehiculo manual realiza menos millas por galon
vehic_manuales<-mtcars[mtcars$am==1,]
min_vm<-min(vehic_manuales$mpg)
min_cm<-vehic_manuales[vehic_manuales$mpg==min_vm,]







