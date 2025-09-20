rm(list = ls())

install.packages(c("readr","tidyr","stringr","lubridate",dependencies = TRUE))

#Cargar librerias
library(dplyr)
library(readr)
library(tidyr)
library(stringr)
library(lubridate)

census <- read_csv("census-retail.csv")
students <- read_csv("students_with_dates.csv")

class(census)
dim(census)
names(census)
str(census)
glimpse(census)
summary(census)

#Practica para ajuste de datos

# Aplicar gather() a census y salvar el resultado como census_wide
census_wide <- gather(census,month,ammount,-YEAR)

# Visualizar el resultado de los 20 primeros regs
head(census_wide,20)

#Ordenar los valores por año
census_wide <- arrange(census_wide,YEAR)


# Utilice la funcion spread para obtener el resultado original en census_long
census_long <- spread(census_wide, month, ammount)
census_long

census_long <- spread(census_wide, YEAR, ammount)
census_long


#Utilice la funcion unite() para unir 2 columnas y definir el separador
census_wide2 <- unite(census_wide,fulldate,YEAR,month,sep="-")

#Utilice la funcin separate() para separar 2 columnas
census_wide2 <- separate(census_wide2,
                         col=fulldate,into=c("year","month"),sep="-")



#Preparar datos para el analisis

str(students)
dim(students)
names(students)

# CONVERSIONES DE TIPOS DATOS
# Convertir Grades a caracter
class(students$Grades)
students$Grades <- as.character(students$Grades)

# Convertir Medu a factor
class(students$Medu)
students$Medu <- as.factor(students$Medu)
table(students$Medu)

# Convertir Fedu a factor
class(students$Fedu)
students$Fedu <- as.factor(students$Fedu)
table(students$Fedu)
# Ver students nuevamente con str()
str(students)



#Trabajar con campos de fecha

# Parsear a date

dmy("17 Sep 2015")

# Parsear a date y time (sin seconds!)
mdy_hm("July 15, 2012 12:56")



x <- c("06/23/2013", "06/30/2013", "07/12/2014")
class(x)

x.date <- mdy(x)
class(x.date)

#Generar un nuevo campo de fecha
datos_fechas <- read.csv("http://mgimond.github.io/ES218/Data/CO2.csv")
head(datos_fechas)

str(datos_fechas)
glimpse(datos_fechas)
datos_fechas$Year

paste(datos_fechas$Year,datos_fechas$Month,"01",sep = "-")
paste(datos_fechas$Year,datos_fechas$Month,"01",sep = "/")


datos_fechas2 <- datos_fechas %>%
  mutate(nueva_fecha = ymd(paste(datos_fechas$Year,datos_fechas$Month,"01",sep = "-")))

str(datos_fechas2)


datos_fechas2 <- datos_fechas2 %>%
  mutate(mes_anio = as.character(datos_fechas2$nueva_fecha, format="%B %Y"))

head(datos_fechas2)
glimpse(datos_fecha2)

Sys.getlocale("LC_TIME")

this_day <- today() 

y <- year(this_day)
m <- month(this_day)
d <-day(this_day)

w <- wday(this_day)
m <- mday(this_day)
y <- yday(this_day)


#Manipulacion de campos string
#Cargar stringr package


# Trim de espacios en blanco
str_trim(c("   Filip ", "Nick  ", " Jonathan"))

# Ajustar string agregando ceros
str_pad(c("23485W", "8823453Q", "994Z"),
        width = 9, side = "left", pad = "-")

# Funciones toupper y tolower
codigo_provincias = c("sj","al","he","ca","li","pu","gu")

codigos_uper <- toupper(codigo_provincias)

codigos_uper

codigos_lower <- tolower(codigos_uper)

codigos_uper
codigos_lower

# Detectar todas las fechas  en 1997
head(students$dob)
str_detect(students$dob,"1997")

students[str_detect(students$dob,"1997"),]

nrow(students[str_detect(students$dob,"1997"),])

# ...Y "M" con "Male"
students$sex <- str_replace(students$sex,"M","Male")

# En la columna sexo, replazar "F" con "Female"...
students$sex <- str_replace(students$sex,"F","Female")

head(students$sex,30)



#Manejo de valores especiales NA, NaN, Inf
#Valores perdidos

#Ver en los valores si hay nulos
is.na(students)
is.na(census)
is.na(students$sex)
#Verifica si hay nulos en la tabla
any(is.na(students))

any(is.na(census))


students[is.na(students$sex),]
#Otra forma de ver si hay nulos en cada atributo
summary(census)


# Use complete.cases() para ver cuales filas no tienens valores perdidos
complete.cases(census)

# Use na.omit() para remove todos los registros con valores perdidos
census2 <- na.omit(census)

dim(census)
dim(census2)

#Outliers
summary()
hist()

summary(students)

hist(students$absences)
hist(students$absences,right = FALSE)

boxplot(students$absences)
