# 📘 Material de Apoyo en R

¡Bienvenido/a al repositorio **MaterialApoyo_R**!  
Este proyecto fue creado como una guía práctica para personas interesadas en aprender el lenguaje de programación **R**, desde lo más básico hasta temas intermedios, con ejemplos reales, ejercicios, datasets y mini-proyectos.

El objetivo es proporcionar un **recurso autodidacta y colaborativo** que facilite el aprendizaje y práctica de R, especialmente útil para estudiantes, profesionales en análisis de datos y personas autodidactas.

## ✨ Características del Repositorio

- 📚 **Contenido estructurado** por niveles de dificultad
- 🔧 **Scripts completamente documentados** con comentarios explicativos
- 📊 **Ejemplos prácticos** con datasets reales
- 🎯 **Proyectos integradores** que combinan múltiples técnicas
- ⚙️ **Configuración automática** del entorno de desarrollo
- 📖 **Documentación detallada** en cada sección

## 🚀 Inicio Rápido

1. **Instalar R y RStudio** desde los enlaces oficiales
2. **Clonar este repositorio** o descargar los archivos
3. **Ejecutar el script de instalación**:
   ```r
   source("config/install_packages.R")
   ```
4. **Comenzar con los ejercicios básicos** en `01_Introduccion_R/`

## 📂 Estructura del Repositorio

```
MaterialApoyo_R/
├── 01_Introduccion_R/           # Fundamentos de R y primeros pasos
│   ├── ejercicios_basicos/      # Operaciones básicas, vectores, matrices
│   ├── factores_y_datos/        # Factores, tipos de datos
│   └── ejercicios_practicos/    # Ejercicios guiados paso a paso
├── 02_Manipulacion_Datos/       # Limpieza y transformación con dplyr
│   ├── dataframes/             # Trabajo con dataframes
│   ├── limpieza_datos/         # stringr, lubridate
│   └── transformaciones/       # Filtros, agrupaciones
├── 03_Visualizacion/            # Gráficos y visualización con ggplot2
│   ├── graficos_basicos/       # Gráficos base de R
│   ├── ggplot2/                # Visualización avanzada
│   └── plotly/                 # Gráficos interactivos
├── 04_Modelado/                 # Modelos estadísticos y ML
│   ├── clustering/             # K-means, clustering jerárquico
│   ├── arboles_decision/       # Árboles de decisión
│   └── modelos_lineales/       # Regresión, correlaciones
├── 05_Analisis_Exploratorio/    # EDA
│   └── practicas_eda/          # Análisis exploratorio
├── datasets/                    # Archivos de datos (CSV)
├── proyectos_finales/           # Proyectos integradores
├── documentacion/               # Presentaciones, PDFs
├── config/                      # Configuración del proyecto
└── README.md                    # Este archivo
```

## 🎯 Contenido por Secciones

### 📚 01_Introduccion_R
- **Ejercicios básicos**: Operaciones aritméticas, variables, vectores, matrices
- **Factores y datos**: Tipos de datos, factores, conversiones
- **Ejercicios prácticos**: Casos de uso reales y consolidación

### 📊 02_Manipulacion_Datos
- **DataFrames**: Creación, exploración y manipulación básica
- **Limpieza de datos**: stringr, lubridate, manejo de valores faltantes
- **Transformaciones**: dplyr, filtros, agrupaciones, resúmenes

### 📈 03_Visualizacion
- **Gráficos básicos**: plot, hist, boxplot, funciones base de R
- **ggplot2**: Gramática de gráficos, capas, temas
- **Plotly**: Gráficos interactivos y dashboards

### 🤖 04_Modelado
- **Clustering**: K-means, clustering jerárquico, validación
- **Árboles de decisión**: Clasificación, regresión, interpretación
- **Modelos lineales**: Regresión, correlaciones, diagnósticos

### 🔍 05_Analisis_Exploratorio
- **Prácticas EDA**: Estadísticas descriptivas, distribuciones, outliers

## 🛠️ Configuración del Entorno

### Requisitos
- R (versión 4.0 o superior)
- RStudio (recomendado)
- Conexión a internet (para instalar paquetes)

### Instalación Automática
```r
# Ejecutar una sola vez para instalar todos los paquetes
source("config/install_packages.R")
```

### Configuración Personalizada
El archivo `config/.Rprofile` se carga automáticamente y configura:
- Opciones globales de R
- Funciones útiles personalizadas
- Carga automática de librerías comunes

## 📝 Ejemplos de Uso

### Ejercicio Básico - Vectores
```r
# Crear vectores con datos de ventas
ventas_lapices <- c(140, 98, 121, 201, 213)
dias <- c('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes')
names(ventas_lapices) <- dias

# Calcular estadísticas
mean(ventas_lapices)
sum(ventas_lapices)
```

### Análisis con ggplot2
```r
library(ggplot2)
library(dplyr)

# Crear gráfico de barras
mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(am))) +
  geom_bar(position = "dodge") +
  labs(title = "Distribución de Cilindros por Tipo de Transmisión",
       x = "Número de Cilindros", y = "Frecuencia")
```

## 🤝 Contribuciones

Este repositorio está diseñado para ser un recurso colaborativo. Las contribuciones son bienvenidas:

1. **Reportar errores** en scripts o documentación
2. **Sugerir mejoras** en ejercicios o explicaciones
3. **Agregar nuevos ejercicios** o proyectos
4. **Mejorar la documentación** existente

## 📚 Material Adicional y Recursos

### 🎯 **Guías de Referencia**
- **[Guía de Referencia Rápida](01_Introduccion_R/guia_referencia_rapida.md)** - Comandos esenciales de R
- **[Glosario de Términos](glosario_terminos_r.md)** - Definiciones importantes
- **[Mejores Prácticas](mejores_practicas_r.md)** - Estándares de programación
- **[Solución de Problemas](solucion_problemas_comunes.md)** - Errores frecuentes y soluciones

### 💼 **Proyectos y Casos Prácticos**
- **[Proyectos de Ejemplo](proyectos_ejemplo.md)** - 5 proyectos completos paso a paso
- **[Casos de Uso Prácticos](casos_uso_practicos.md)** - Escenarios reales con datasets
- **[Integración con Herramientas](integracion_herramientas.md)** - Conectar R con otras tecnologías

### 📖 **Recursos de Aprendizaje**
- **[Recursos de Aprendizaje](recursos_aprendizaje.md)** - Cursos, libros, sitios web
- **[Fuentes y Referencias](fuentes_referencias.md)** - Referencias académicas especializadas
- **[Checklist de Progreso](checklist_progreso.md)** - Sistema de seguimiento por niveles

### 📋 **Índice Completo**
- **[Índice de Material Adicional](INDICE_MATERIAL_ADICIONAL.md)** - Navegación completa del contenido

### 🌐 **Enlaces Externos**
- [Documentación oficial de R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)
- [R for Data Science](https://r4ds.had.co.nz/)
- [Tidyverse](https://www.tidyverse.org/)
- [ggplot2 Documentation](https://ggplot2.tidyverse.org/)

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

---

**¡Feliz aprendizaje con R! 🎉**
