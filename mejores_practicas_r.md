# 🎯 Mejores Prácticas para Programar en R

## 📝 **Estilo de Código**

### Nomenclatura
```r
# ✅ BUENO: Nombres descriptivos y claros
edad_promedio <- 25
nombre_completo <- "Juan Pérez"
datos_ventas <- read.csv("ventas.csv")

# ❌ MALO: Nombres confusos o abreviados
e <- 25
nc <- "Juan Pérez"
dv <- read.csv("ventas.csv")
```

### Espaciado y Formato
```r
# ✅ BUENO: Espaciado consistente
edad <- 25
nombre <- "María"
resultado <- edad + 10

# ✅ BUENO: Operadores con espacios
suma <- x + y
division <- a / b
asignacion <- "valor"

# ❌ MALO: Sin espaciado
edad<-25
nombre<-"María"
suma<-x+y
```

### Comentarios
```r
# ✅ BUENO: Comentarios útiles y claros
# Calcular el IMC usando peso en kg y altura en metros
imc <- peso / (altura^2)

# Filtrar datos de estudiantes con calificación mayor a 80
estudiantes_aprobados <- estudiantes[estudiantes$calificacion > 80, ]

# ❌ MALO: Comentarios obvios o innecesarios
# Asignar valor a variable
x <- 5
# Sumar números
y <- 2 + 3
```

## 🏗️ **Estructura de Proyectos**

### Organización de Archivos
```
mi_proyecto/
├── data/
│   ├── raw/           # Datos originales
│   ├── processed/     # Datos procesados
│   └── external/      # Datos externos
├── scripts/
│   ├── 01_import.R    # Importar datos
│   ├── 02_clean.R     # Limpiar datos
│   ├── 03_analyze.R   # Análisis
│   └── 04_visualize.R # Visualizaciones
├── output/
│   ├── figures/       # Gráficos
│   └── tables/        # Tablas
├── reports/
│   └── report.Rmd     # Reporte final
└── README.md
```

### Encabezados de Scripts
```r
# ==============================================================================
# SCRIPT: Análisis de Ventas 2024
# AUTOR: Tu Nombre
# FECHA: 2024-01-15
# DESCRIPCIÓN: Análisis de tendencias de ventas mensuales
# DEPENDENCIAS: tidyverse, ggplot2, readr
# ==============================================================================

# Cargar librerías
library(tidyverse)
library(ggplot2)
library(readr)

# Configuración
options(scipen = 999)  # Evitar notación científica
```

## 🔧 **Manejo de Datos**

### Lectura de Archivos
```r
# ✅ BUENO: Especificar tipos de datos
datos <- read_csv("datos.csv", 
                  col_types = cols(
                    id = col_integer(),
                    nombre = col_character(),
                    fecha = col_date("%Y-%m-%d")
                  ))

# ✅ BUENO: Verificar datos después de cargar
head(datos)
str(datos)
summary(datos)

# ❌ MALO: Cargar sin verificar
datos <- read.csv("datos.csv")
```

### Manipulación de Datos
```r
# ✅ BUENO: Usar pipes para operaciones encadenadas
resultado <- datos %>%
  filter(edad >= 18) %>%
  group_by(categoria) %>%
  summarise(
    promedio = mean(ventas),
    total = sum(ventas),
    n = n()
  ) %>%
  arrange(desc(promedio))

# ❌ MALO: Operaciones anidadas confusas
resultado <- arrange(
  summarise(
    group_by(
      filter(datos, edad >= 18),
      categoria
    ),
    promedio = mean(ventas)
  ),
  desc(promedio)
)
```

## 📊 **Visualización**

### ggplot2 Efectivo
```r
# ✅ BUENO: Gráfico claro y bien etiquetado
grafico <- ggplot(datos, aes(x = mes, y = ventas)) +
  geom_line(color = "blue", size = 1) +
  geom_point(color = "red", size = 2) +
  labs(
    title = "Tendencia de Ventas Mensuales 2024",
    subtitle = "Enero a Diciembre",
    x = "Mes",
    y = "Ventas ($)",
    caption = "Fuente: Base de datos interna"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# ❌ MALO: Gráfico sin etiquetas ni formato
plot(datos$mes, datos$ventas)
```

## 🚀 **Rendimiento y Eficiencia**

### Operaciones Vectorizadas
```r
# ✅ BUENO: Operaciones vectorizadas
edades <- c(25, 30, 35, 40, 45)
edades_cuadradas <- edades^2

# ❌ MALO: Bucles innecesarios
edades_cuadradas <- numeric(length(edades))
for(i in 1:length(edades)) {
  edades_cuadradas[i] <- edades[i]^2
}
```

### Manejo de Memoria
```r
# ✅ BUENO: Limpiar objetos grandes
datos_grandes <- read.csv("archivo_muy_grande.csv")
# ... análisis ...
rm(datos_grandes)  # Liberar memoria
gc()  # Forzar garbage collection

# ✅ BUENO: Usar data.table para datasets grandes
library(data.table)
datos <- fread("archivo_grande.csv")
```

## 🛡️ **Manejo de Errores**

### Validación de Datos
```r
# ✅ BUENO: Verificar condiciones
if (!file.exists("datos.csv")) {
  stop("El archivo datos.csv no existe")
}

if (nrow(datos) == 0) {
  warning("El dataset está vacío")
}

# ✅ BUENO: Manejo de errores con tryCatch
resultado <- tryCatch({
  read.csv("datos.csv")
}, error = function(e) {
  message("Error al leer archivo: ", e$message)
  return(NULL)
})
```

### Funciones Robustas
```r
# ✅ BUENO: Función con validaciones
calcular_promedio <- function(x, na.rm = TRUE) {
  # Validar entrada
  if (!is.numeric(x)) {
    stop("x debe ser numérico")
  }
  
  if (length(x) == 0) {
    stop("x no puede estar vacío")
  }
  
  # Calcular resultado
  mean(x, na.rm = na.rm)
}

# ❌ MALO: Función sin validaciones
calcular_promedio <- function(x) {
  mean(x)
}
```

## 📋 **Reproducibilidad**

### Control de Versiones
```r
# ✅ BUENO: Usar set.seed() para aleatoriedad
set.seed(123)
muestra <- sample(1:100, 10)

# ✅ BUENO: Especificar versiones de paquetes
# install.packages("tidyverse", version = "1.3.0")
```

### Documentación
```r
# ✅ BUENO: Documentar funciones
#' Calcular estadísticas descriptivas
#'
#' @param x Vector numérico
#' @param na.rm Lógico, eliminar valores NA
#' @return Lista con estadísticas
#' @examples
#' estadisticas(c(1, 2, 3, 4, 5))
estadisticas <- function(x, na.rm = TRUE) {
  list(
    media = mean(x, na.rm = na.rm),
    mediana = median(x, na.rm = na.rm),
    desviacion = sd(x, na.rm = na.rm)
  )
}
```

## 🔄 **Workflow Efectivo**

### Desarrollo Iterativo
```r
# ✅ BUENO: Proceso paso a paso
# 1. Cargar datos
datos <- read.csv("datos.csv")

# 2. Explorar datos
head(datos)
str(datos)

# 3. Limpiar datos
datos_limpios <- datos %>%
  filter(!is.na(ventas)) %>%
  mutate(ventas_miles = ventas / 1000)

# 4. Análisis
resultado <- datos_limpios %>%
  group_by(categoria) %>%
  summarise(total = sum(ventas_miles))

# 5. Visualización
ggplot(resultado, aes(x = categoria, y = total)) +
  geom_col()
```

### Testing y Validación
```r
# ✅ BUENO: Verificar resultados
# Verificar que no hay valores negativos
stopifnot(all(datos$ventas >= 0))

# Verificar que los totales son correctos
total_esperado <- 1000
total_calculado <- sum(datos$ventas)
if (abs(total_calculado - total_esperado) > 0.01) {
  warning("Los totales no coinciden")
}
```

## 📚 **Recursos Adicionales**

### Herramientas de Calidad
- **lintr** - Análisis de código
- **styler** - Formateo automático
- **goodpractice** - Mejores prácticas
- **covr** - Cobertura de tests

### Paquetes Útiles
- **here** - Rutas relativas
- **fs** - Manipulación de archivos
- **glue** - Interpolación de strings
- **purrr** - Programación funcional

---

**💡 Recuerda:** El código se escribe una vez, pero se lee muchas veces. Prioriza la claridad sobre la brevedad.
