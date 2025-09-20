# 📋 Guía de Referencia Rápida - R Básico

## 🔢 Operadores Aritméticos
```r
+    # Suma
-    # Resta
*    # Multiplicación
/    # División
^    # Potencia
%%   # Módulo (resto)
%/%  # División entera
```

## 📊 Funciones Estadísticas Básicas
```r
mean(x)     # Media
median(x)   # Mediana
sd(x)       # Desviación estándar
var(x)      # Varianza
min(x)      # Mínimo
max(x)      # Máximo
sum(x)      # Suma
length(x)   # Longitud
```

## 🎯 Creación de Vectores
```r
c(1, 2, 3)              # Vector numérico
c("a", "b", "c")        # Vector de texto
1:10                    # Secuencia
seq(1, 10, by=2)        # Secuencia con paso
rep(1, 5)               # Repetir valor
```

## 🔍 Acceso a Elementos
```r
x[1]                    # Primer elemento
x[1:3]                  # Elementos 1 a 3
x[c(1,3,5)]             # Elementos específicos
x[x > 5]                # Elementos que cumplen condición
```

## 📋 Funciones de Información
```r
class(x)                # Tipo de objeto
str(x)                  # Estructura
summary(x)              # Resumen estadístico
head(x)                 # Primeras filas
tail(x)                 # Últimas filas
dim(x)                  # Dimensiones
```
