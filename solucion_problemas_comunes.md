# 🔧 Solución de Problemas Comunes en R

## ❌ **Errores Más Frecuentes**

### 1. Error: "object not found"
```r
# ❌ PROBLEMA:
resultado <- x + y
# Error: object 'x' not found

# ✅ SOLUCIÓN:
x <- 5
y <- 3
resultado <- x + y
```

### 2. Error: "non-numeric argument to binary operator"
```r
# ❌ PROBLEMA:
datos <- c("1", "2", "3")
suma <- datos + 1
# Error: non-numeric argument to binary operator

# ✅ SOLUCIÓN:
datos <- as.numeric(c("1", "2", "3"))
suma <- datos + 1
# O directamente:
datos <- c(1, 2, 3)
suma <- datos + 1
```

### 3. Error: "subscript out of bounds"
```r
# ❌ PROBLEMA:
vector <- c(1, 2, 3)
elemento <- vector[5]
# Error: subscript out of bounds

# ✅ SOLUCIÓN:
if (length(vector) >= 5) {
  elemento <- vector[5]
} else {
  elemento <- NA
  print("Índice fuera de rango")
}
```

### 4. Error: "replacement has length zero"
```r
# ❌ PROBLEMA:
datos <- data.frame(a = 1:3, b = 4:6)
datos[datos$a > 5, "b"] <- c()
# Error: replacement has length zero

# ✅ SOLUCIÓN:
filtro <- datos$a > 5
datos[filtro, "b"] <- NA
```

## 📊 **Problemas con DataFrames**

### 1. Factores No Deseados
```r
# ❌ PROBLEMA:
datos <- read.csv("datos.csv", stringsAsFactors = TRUE)
# Las columnas de texto se convierten en factores

# ✅ SOLUCIÓN:
datos <- read.csv("datos.csv", stringsAsFactors = FALSE)
# O usar readr:
library(readr)
datos <- read_csv("datos.csv")
```

### 2. Nombres de Columnas con Espacios
```r
# ❌ PROBLEMA:
datos <- data.frame("ventas mensual" = 1:5)
datos$ventas mensual  # Error

# ✅ SOLUCIÓN:
# Opción 1: Usar backticks
datos$`ventas mensual`

# Opción 2: Renombrar columnas
names(datos) <- gsub(" ", "_", names(datos))
datos$ventas_mensual
```

### 3. Problemas con Fechas
```r
# ❌ PROBLEMA:
fechas <- c("01/15/2024", "02/15/2024")
as.Date(fechas)
# Error: character string is not in a standard unambiguous format

# ✅ SOLUCIÓN:
fechas <- as.Date(fechas, format = "%m/%d/%Y")
# O usar lubridate:
library(lubridate)
fechas <- mdy(c("01/15/2024", "02/15/2024"))
```

## 📈 **Problemas con Gráficos**

### 1. Gráficos No Aparecen
```r
# ❌ PROBLEMA:
plot(1:10)
# El gráfico no se muestra

# ✅ SOLUCIÓN:
# En RStudio, verificar el panel "Plots"
# Si está vacío, ejecutar:
dev.off()  # Cerrar dispositivos gráficos
plot(1:10)  # Intentar de nuevo
```

### 2. Etiquetas de Eje Truncadas
```r
# ❌ PROBLEMA:
nombres_largos <- paste("Categoría muy larga", 1:5)
datos <- data.frame(categoria = nombres_largos, valor = 1:5)
barplot(datos$valor, names.arg = datos$categoria)

# ✅ SOLUCIÓN:
barplot(datos$valor, names.arg = datos$categoria,
        las = 2,  # Rotar etiquetas
        cex.names = 0.8)  # Reducir tamaño
```

### 3. Colores No Distinguibles
```r
# ❌ PROBLEMA:
plot(1:10, col = 1:10)
# Algunos colores se ven iguales

# ✅ SOLUCIÓN:
# Usar paleta de colores distintiva
library(RColorBrewer)
colores <- brewer.pal(10, "Set3")
plot(1:10, col = colores)

# O usar colores personalizados
colores <- rainbow(10)
plot(1:10, col = colores)
```

## 🐛 **Problemas de Rendimiento**

### 1. Código Lento con Bucles
```r
# ❌ PROBLEMA: Bucle lento
resultado <- numeric(10000)
for(i in 1:10000) {
  resultado[i] <- i^2
}

# ✅ SOLUCIÓN: Vectorización
resultado <- (1:10000)^2
```

### 2. Memoria Insuficiente
```r
# ❌ PROBLEMA:
datos_grandes <- matrix(rnorm(10000000), ncol = 1000)
# Error: cannot allocate vector of size X Mb

# ✅ SOLUCIÓN:
# Limpiar memoria
rm(list = ls())
gc()

# Procesar por chunks
for(i in 1:10) {
  chunk <- datos_grandes[((i-1)*1000+1):(i*1000), ]
  # Procesar chunk
  rm(chunk)
}
```

## 📦 **Problemas con Paquetes**

### 1. Paquete No Se Instala
```r
# ❌ PROBLEMA:
install.packages("paquete_inexistente")
# Error: package 'paquete_inexistente' is not available

# ✅ SOLUCIÓN:
# Verificar nombre correcto
available.packages()[grep("tidyverse", available.packages()[,"Package"]), "Package"]

# Verificar repositorio
options(repos = c(CRAN = "https://cran.r-project.org/"))
```

### 2. Conflictos de Funciones
```r
# ❌ PROBLEMA:
library(dplyr)
library(MASS)
filter(1:10, 1:10 > 5)
# Error: función ambigua

# ✅ SOLUCIÓN:
# Especificar paquete
dplyr::filter(data.frame(x = 1:10), x > 5)
# O cargar en orden específico
```

### 3. Versiones Incompatibles
```r
# ❌ PROBLEMA:
# Error de versión de paquete

# ✅ SOLUCIÓN:
# Verificar versiones
packageVersion("tidyverse")
R.version

# Actualizar paquetes
update.packages(ask = FALSE)
```

## 🔍 **Herramientas de Diagnóstico**

### 1. Función debug()
```r
# Para debuggear funciones
mi_funcion <- function(x) {
  resultado <- x * 2
  return(resultado)
}

debug(mi_funcion)
mi_funcion(5)
# Ejecutar paso a paso
undebug(mi_funcion)
```

### 2. Función traceback()
```r
# Para ver la secuencia de llamadas en errores
error_funcion <- function() {
  x <- 1
  y <- "texto"
  resultado <- x + y
}

error_funcion()
traceback()
```

### 3. Función browser()
```r
# Para pausar ejecución y examinar variables
mi_funcion <- function(x) {
  resultado <- x * 2
  browser()  # Pausa aquí
  return(resultado)
}
```

## 📋 **Checklist de Solución de Problemas**

### Antes de Pedir Ayuda
- [ ] ¿Has leído el mensaje de error completo?
- [ ] ¿Has verificado que las variables existen?
- [ ] ¿Has verificado los tipos de datos?
- [ ] ¿Has probado con datos más pequeños?
- [ ] ¿Has reiniciado R/RStudio?

### Información a Incluir al Pedir Ayuda
- [ ] Versión de R: `R.version.string`
- [ ] Sistema operativo: `Sys.info()`
- [ ] Paquetes cargados: `sessionInfo()`
- [ ] Código que produce el error
- [ ] Mensaje de error completo
- [ ] Datos de ejemplo (si es posible)

## 🆘 **Recursos de Ayuda**

### Ayuda en R
```r
# Ayuda de función
help(mean)
?mean

# Ayuda de paquete
help(package = "ggplot2")

# Buscar en ayuda
help.search("regression")
```

### Comunidades Online
- **Stack Overflow**: [stackoverflow.com/questions/tagged/r](https://stackoverflow.com/questions/tagged/r)
- **RStudio Community**: [community.rstudio.com](https://community.rstudio.com/)
- **Reddit**: [reddit.com/r/rstats](https://www.reddit.com/r/rstats/)

### Comandos Útiles
```r
# Ver sesión actual
sessionInfo()

# Ver objetos en memoria
ls()

# Limpiar memoria
rm(list = ls())
gc()

# Ver directorio de trabajo
getwd()

# Cambiar directorio
setwd("ruta/a/directorio")
```

---

**💡 Tip:** La mayoría de errores en R son por tipos de datos incorrectos o variables no definidas. Siempre verifica estos dos puntos primero.
