# ==============================================================================
# SCRIPT: Manejo de DataFrames - Clase 7
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script enseña las operaciones básicas con DataFrames en R
#              usando el dataset mtcars. Incluye exploración, filtrado y 
#              manipulación de datos tabulares.
# ==============================================================================

# ==============================================================================
# SECCIÓN 1: EXPLORACIÓN BÁSICA DEL DATAFRAME
# ==============================================================================

# Cargar el dataset mtcars (datos de automóviles de 1974)
mtcars

# Obtener las dimensiones del DataFrame (filas, columnas)
dim(mtcars)

# Mostrar los primeros 5 registros
head(mtcars, 5)

# Mostrar los últimos 5 registros
tail(mtcars, 5)

# Mostrar la estructura del DataFrame (tipos de datos, columnas, etc.)
str(mtcars)

# Obtener resumen estadístico del DataFrame
summary(mtcars)

# ==============================================================================
# SECCIÓN 2: ANÁLISIS Y FILTRADO DE DATOS
# ==============================================================================

# Crear una tabla de frecuencias para la variable cyl (cilindros)
table(mtcars$cyl) 

# Filtrar vehículos con 4 cilindros
mtcars[mtcars$cyl == 4, ]

# Filtrar vehículos con 8 cilindros
mtcars[mtcars$cyl == 8, ]


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







