# Material de apoyo en R

Guía práctica para aprender R desde cero hasta un análisis completo: leer datos, limpiarlos, graficarlos, describirlos y ajustar un modelo sencillo. El material está pensado para estudiarlo en RStudio, script por script, en el orden de las carpetas.

R es un lenguaje para estadística y análisis de datos. RStudio es el programa donde se escribe y se ejecuta ese código. Este repositorio es el cuaderno de práctica: ejercicios comentados, datos en CSV y proyectos que juntan varias técnicas.

## Cómo empezar

Necesitas R 4.0 o superior, RStudio Desktop y conexión a internet la primera vez, para instalar paquetes.

1. Instala R desde [CRAN](https://cran.r-project.org/). En Windows entra en *Download R for Windows*, luego *base*, y ejecuta el instalador con las opciones por defecto.
2. Instala [RStudio Desktop](https://posit.co/download/rstudio-desktop/) (la versión gratuita). En macOS arrastra la aplicación a *Applications*. En Ubuntu o Debian puedes instalar R con `sudo apt update` y `sudo apt install r-base r-base-dev`, y RStudio desde el instalador `.deb` de Posit.
3. Abre RStudio y elige **File > Open Project**, o simplemente **File > Open Folder** y selecciona esta carpeta (`MaterialApoyo_R`).
4. Comprueba que el directorio de trabajo es la raíz del material:

```r
getwd()
R.version
```

5. Instala los paquetes del curso. Hazlo una sola vez, con el directorio de trabajo en la raíz:

```r
source("config/install_packages.R")
```

Ese script instala lo que usan los ejercicios: el conjunto tidyverse (`dplyr`, `ggplot2`, `readr`, `stringr`, `lubridate`), gráficos interactivos (`plotly`), modelado (`caret`, `rpart`, `cluster`) y utilidades de reportes (`rmarkdown`, `knitr`).

6. Empieza por `01_Introduccion_R/ejercicios_basicos/`. Abre un script, colócate en la primera línea y ejecútala con **Ctrl + Enter**. Lee el comentario, mira el resultado en la consola y sigue línea a línea.

En **Tools > Global Options > General** conviene dejar *Restore .RData into workspace at startup* desmarcado y *Save workspace* en *Never*. Así cada sesión empieza limpia y el resultado depende solo del script, no de objetos viejos en memoria.

### Si algo no funciona

| Qué ves | Qué hacer |
| --- | --- |
| R no se reconoce en la terminal | Vuelve a abrir RStudio después de instalar R. En Windows, si hace falta, agrega la carpeta `bin` de R a la variable de entorno PATH. |
| Un paquete no se instala | Revisa la conexión y fija el repositorio: `options(repos = c(CRAN = "https://cran.r-project.org/"))`. Luego instala ese paquete solo: `install.packages("tidyverse")`. |
| `cannot open file` o no encuentra un CSV | El directorio de trabajo no es la raíz. Usa `getwd()` y `setwd()` con la ruta de `MaterialApoyo_R`, o abre la carpeta de nuevo desde RStudio. |
| RStudio no abre | En Windows, pruébalo como administrador y revisa el antivirus. En macOS, autoriza la app en Privacidad y seguridad. |

Para un diagnóstico rápido: `sessionInfo()`, `installed.packages()` y `list.files()`. La ayuda de una función se abre con `?mean` o `help.start()`.

## Cómo está organizado

Las carpetas numeradas son el curso. El resto es apoyo: datos, configuración, plantillas y proyectos ya armados.

```
MaterialApoyo_R/
├── 01_Introduccion_R/        # Sintaxis, vectores, funciones, condicionales y bucles
├── 02_Manipulacion_Datos/    # Data frames, lectura de CSV, limpieza y dplyr
├── 03_Visualizacion/         # Gráficos base, ggplot2 y plotly
├── 04_Modelado/              # Clustering y árboles de decisión
├── 05_Analisis_Exploratorio/ # Estadística descriptiva y práctica de EDA
├── datasets/                 # CSV que usan los ejercicios y proyectos
├── proyectos_finales/        # Gimnasio y Titanic, de punta a punta
├── config/                   # Instalación de paquetes y utilidades
├── templates/                # Plantillas de análisis, reporte y dashboard
└── documentacion/            # Notas y material de apoyo escrito
```

Dentro de la introducción también están `condicionales.R`, `bucles.R`, los ejercicios progresivos y la guía de referencia rápida (`01_Introduccion_R/guia_referencia_rapida.md`).

### Qué se aprende en cada parte

**01. Introducción.** Cómo se escribe R: operaciones, variables, tipos de datos, vectores, matrices, listas, factores, funciones, condicionales y bucles. Un vector guarda varios valores del mismo tipo en una sola variable. Un factor es una categoría con niveles fijos, por ejemplo `"Si"` y `"No"`.

**02. Manipulación de datos.** Un data frame es una tabla: filas como observaciones y columnas como variables. Aquí se leen CSV, se eligen columnas, se filtran filas y se crean variables nuevas. `dplyr` hace ese trabajo con verbos claros (`filter`, `select`, `mutate`, `group_by`, `summarise`). `stringr` limpia texto y `lubridate` trabaja con fechas.

**03. Visualización.** Primero los gráficos base de R (`plot`, `hist`, `barplot`). Después `ggplot2`, que arma un gráfico por capas: datos, estética (`aes`) y geometría (`geom_point`, `geom_col`, `geom_boxplot`). `plotly` convierte esos gráficos en figuras en las que se puede hacer zoom y ver valores al pasar el cursor.

**04. Modelado.** Agrupar observaciones parecidas (clustering, por ejemplo k-means) y clasificar o predecir con árboles de decisión. El caso del Titanic, en `proyectos_finales/`, usa un árbol para estimar si un pasajero sobrevivió.

**05. Análisis exploratorio.** Antes de modelar se describe el dataset: medias, dispersión, distribuciones, valores atípicos y relaciones entre variables. Esa exploración se llama EDA.

**Proyectos finales.** Dos análisis cerrados. El del gimnasio (`02 Proyecto Final Gimnasio.R`, con `datasets/gym_members_exercise_tracking.csv`) recorre descripción, correlaciones y gráficos. El del Titanic (`03  Arbol de desición Titanic.R`) ajusta y lee un árbol de decisión.

## Ruta de estudio

Avanza en orden. Cada nivel supone el anterior. Una sesión corta y diaria rinde más que un maratón de un solo día: ejecuta el código, cambia un número o un filtro y vuelve a correrlo.

| Nivel | Qué dominar | Dónde practicarlo | Listo cuando… |
| --- | --- | --- | --- |
| 1. Fundamentos | R frente a RStudio, aritmética, variables, tipos, vectores y funciones como `sum` y `mean` | `01_Introduccion_R/` | Completaste al menos tres scripts de `ejercicios_basicos/` |
| 2. Datos | Data frames, `read.csv`, `head`, `str`, `summary`, filtros y columnas nuevas | `02_Manipulacion_Datos/` | Analizaste un CSV pequeño de `datasets/` |
| 3. Gráficos | Dispersión, histograma, barras, y un `ggplot` con título y ejes | `03_Visualizacion/` | Hiciste cinco gráficos distintos y sabes qué pregunta responde cada uno |
| 4. Estadística | Tendencia central, dispersión, correlación, valor *p* e intervalos | `05_Analisis_Exploratorio/` y `04_Modelado/` | Explicaste un resultado con tus palabras, no solo con el número |
| 5. Proyecto | Pregunta, limpieza, EDA, gráfico, modelo y conclusión | `proyectos_finales/` | Entregaste un análisis con código comentado |

Habilidades que suman después del recorrido: escribir funciones propias, usar R Markdown para un reporte, manejar fechas y valores faltantes, y guardar el trabajo con Git.

Tres ritmos posibles:

- **Dos a cuatro semanas.** Referencia rápida, ejercicios básicos y un gráfico con un CSV de ventas o del gimnasio. Cubres los niveles 1 y 2.
- **Dos a tres meses.** El orden de las carpetas, un caso de cada bloque y uno de los proyectos finales.
- **Un semestre.** Todo lo anterior, más un reporte en R Markdown y la lectura de *R for Data Science*.


## Glosario breve

Términos que aparecen en los scripts. Si uno se cruza en un ejercicio, la definición de aquí alcanza para seguir.

| Término | Significado |
| --- | --- |
| Objeto | Cualquier cosa que R guarda en memoria con un nombre: un número, un vector, una tabla. |
| Variable | El nombre con el que recuperas ese objeto. Se asigna con `<-`. |
| Vector | Una fila de valores del mismo tipo. `c(140, 98, 121)` es un vector numérico. |
| Matriz | Tabla en la que todas las celdas son del mismo tipo. |
| Data frame | Tabla de análisis: cada fila es un caso y cada columna una variable, que puede ser de distinto tipo. |
| Factor | Variable categórica con niveles definidos, útil en gráficos y modelos. |
| Función | Código con nombre que recibe argumentos y devuelve un resultado. `mean(x)` es una función. |
| Argumento | Valor que le pasas a una función. En `mean(x, na.rm = TRUE)`, `x` y `na.rm` son argumentos. |
| Script | Archivo `.R` con el código. Se puede volver a ejecutar; la consola sola no deja ese registro. |
| Paquete | Conjunto de funciones instalable desde CRAN, la red oficial de paquetes. Se carga con `library()`. |
| Base R | Lo que ya viene con R, sin instalar nada más: `mean`, `plot`, `read.csv`. |
| Tidyverse | Familia de paquetes que comparten una forma de trabajar: datos ordenados, verbos claros y el operador `%>%`. |
| Pipe `%>%` | Pasa el resultado de la izquierda como primer argumento de la función de la derecha. Se lee "y luego". |
| dplyr | Paquete del tidyverse para filtrar, elegir, crear columnas y resumir tablas. |
| ggplot2 | Paquete para gráficos por capas, a partir de la gramática de gráficos. |
| EDA | Análisis exploratorio: resumir y graficar un dataset para entenderlo antes de modelar. |
| Estadística descriptiva | Números que resumen lo observado: media, mediana, mínimo, máximo, desviación. |
| Histograma | Gráfico de la distribución de una variable numérica, en intervalos. |
| Clustering | Agrupar filas parecidas entre sí sin una etiqueta previa. K-means es el método que más se usa al empezar. |
| IDE | Entorno donde se programa. RStudio es el IDE habitual para R. |
| String | Texto. En R va entre comillas. |
| Tipo de dato | Clase del valor: numérico, carácter, lógico, factor, fecha. |

Hay una guía de comandos, más corta y orientada a copiar, en `01_Introduccion_R/guia_referencia_rapida.md`.

## Datos de práctica

Todos están en `datasets/`, en CSV. Varios traen valores faltantes a propósito, para practicar limpieza. Ábrelos con `read.csv("datasets/nombre.csv")` desde la raíz del proyecto.

| Archivo | Para qué sirve |
| --- | --- |
| `ventas_tienda.csv` | Ventas por producto y categoría. Tendencias y gráficos de barras. |
| `datos_medicos.csv` | Pacientes. Comparar grupos y ver factores de riesgo. |
| `viviendas.csv` | Precio y características de viviendas. Regresión simple. |
| `encuesta_satisfaccion.csv` | Respuestas de una encuesta. Frecuencias y categorías. |
| `rendimiento_academico.csv` | Calificaciones y asistencia. Relación entre variables. |
| `students_with_dates.csv` | Estudiantes con fechas. Práctica de `lubridate`. |
| `gym_members_exercise_tracking.csv` | Socios de un gimnasio. Proyecto final y correlaciones. |
| `census-retail.csv` | Censo de comercio. Limpieza y transformación. |

R también trae tablas de ejemplo sin descargar nada: `mtcars` (autos) e `iris` (flores). Sirven para probar un gráfico en dos líneas.

## Proyectos para armar

Cinco ejercicios largos, del más guiado al más abierto. Los tres primeros pueden apoyarse en los CSV de `datasets/`. Los dos últimos piden paquetes extra y, en el de texto, acceso a una API.

1. **Tablero de ventas.** Filtrar por categoría y fecha, ver la tendencia y el total por categoría. Practica `dplyr`, `ggplot2` y, si quieres ir más lejos, una app Shiny. Datos: `ventas_tienda.csv`.
2. **Datos médicos.** Describir edad, IMC y colesterol, comparar grupos con diabetes o hipertensión y leer una matriz de correlación. Datos: `datos_medicos.csv`.
3. **Precio de viviendas.** Separar entrenamiento y prueba, ajustar una regresión con `caret` y mirar el error (RMSE) y el ajuste (R²) en un gráfico de real contra predicho. Datos: `viviendas.csv`.
4. **Sentimiento en texto.** Partir frases en palabras con `tidytext`, puntuar el tono y ver qué términos se repiten. Hace falta autenticación si los textos salen de una red social.
5. **Recomendaciones.** Con una tabla de usuario, producto y calificación, sugerir lo que personas parecidas valoraron bien. Es el más largo: mide similitud y ordena sugerencias.

Un proyecto queda cerrado cuando tiene pregunta, datos limpios, al menos un gráfico que responda esa pregunta y un párrafo de conclusión. Empieza por la versión pequeña (cargar, resumir, un gráfico) y solo después agrega el modelo o la app.

En `proyectos_finales/` ya hay dos análisis escritos: gimnasio y árbol del Titanic. Léelos después de los niveles 3 y 4, y compara tu estructura con la de esos scripts. Las plantillas de `templates/` sirven para pasar el mismo análisis a un reporte o a un tablero.

## R junto con otras herramientas

R no tiene que hacer todo el flujo. Estas son las conexiones que más se usan, y el paquete con el que se hacen.

| Quieres… | Paquete | Idea |
| --- | --- | --- |
| Llamar a Python desde R | `reticulate` | `r_to_py()` y `py_to_r()` convierten tablas entre los dos lenguajes. |
| Compartir una tabla con otro programa | `readr` o `writexl` | Un CSV o un Excel lo abre Python, Power BI o Tableau. |
| Consultar una base de datos | `DBI` más el driver (`RSQLite`, `RPostgres`, `RMariaDB`) | Te conectas, corres un `SELECT` y el resultado llega como data frame. SQLite es un solo archivo, útil para practicar. |
| Leer una API | `httr` y `jsonlite` | Pides la URL y conviertes el JSON en una lista o tabla de R. |
| Leer una hoja de cálculo en la nube | `googlesheets4` | Lees y escribes una Google Sheet con la cuenta de Google. |
| Publicar un gráfico interactivo | `shiny` | Una interfaz (botones, filtros) y un servidor que recalcula el gráfico. |
| Dejar un reporte | `rmarkdown` | Un archivo que mezcla texto y código y se exporta a HTML, PDF o Word. |
| Ofrecer una función por HTTP | `plumber` | El script de R se vuelve un endpoint que otro sistema puede llamar. |
| Guardar versiones del análisis | Git | Cada commit deja registrado qué cambió y por qué. RStudio trae panel de Git. |
| Correr el mismo análisis en otro equipo | Docker, imagen `rocker/tidyverse` | El contenedor lleva R y los paquetes, así el resultado no depende de tu instalación. |
| Programar una corrida diaria | Programador de tareas de Windows, cron o GitHub Actions | El sistema ejecuta `Rscript tu_analisis.R` a la hora que indiques. |

Para intercambiar datos, el camino más simple sigue siendo un CSV:

```r
write.csv(mtcars, "mtcars.csv", row.names = FALSE)
datos <- read.csv("mtcars.csv")
```

La integración sale bien cuando el paso de R está claro (limpiar, resumir, graficar o modelar) y el otro programa solo consume ese resultado.

## Para seguir aprendiendo

Cuando un ejercicio de este material se quede corto, estas fuentes están ordenadas como el propio curso.

**Para empezar**

- [R for Data Science](https://r4ds.had.co.nz/), de Hadley Wickham y Garrett Grolemund. El libro de cabecera, gratis, en el mismo orden: datos, gráficos y modelos.
- [Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r) en DataCamp, y [R Programming](https://www.coursera.org/learn/r-programming) de Johns Hopkins en Coursera.
- Hojas de una página: [R](https://rstudio.github.io/cheatsheets/translations/spanish/r-base-espanol.pdf), [dplyr](https://dplyr.tidyverse.org/), [ggplot2](https://ggplot2.tidyverse.org/) y [R Markdown](https://rmarkdown.rstudio.com/).

**Para profundizar**

- [Advanced R](https://adv-r.hadley.nz/), de Hadley Wickham, cuando quieras entender cómo funciona el lenguaje.
- *R Graphics Cookbook*, de Winston Chang, para un gráfico concreto que aún no sabes construir.
- *Mastering Shiny*, de Hadley Wickham, cuando pases del script a una aplicación.

**Dónde preguntar y dónde mirar código**

- [RStudio Community](https://community.rstudio.com/) y [Stack Overflow, etiqueta r](https://stackoverflow.com/questions/tagged/r).
- [R-bloggers](https://www.r-bloggers.com/) y el resumen semanal [R Weekly](https://rweekly.org/).
- [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday): un dataset nuevo cada semana para practicar.
- [CRAN Task Views](https://cran.r-project.org/web/views/) agrupa paquetes por tema. La documentación de cada función está en [rdocumentation.org](https://www.rdocumentation.org/).

**Referencias que citan los textos del curso**

- Wickham, H. (2014). *Tidy Data*. Journal of Statistical Software, 59(10). La idea de tabla ordenada que usa todo el tidyverse.
- Wickham, H. (2016). *ggplot2: Elegant Graphics for Data Analysis*. Springer.
- Wilkinson, L. (2005). *The Grammar of Graphics*. Springer. La base de ggplot2.
- Kabacoff, R. I. *R in Action*. Manning. Recorrido amplio de análisis con R.

En YouTube, StatQuest explica la estadística con calma. En español, los canales de ciencia de datos de Latam cubren tidyverse y gráficos. El buscador de paquetes y la ayuda `?funcion` resuelven más dudas que un tutorial genérico: la pregunta útil incluye qué hiciste, qué esperabas y el mensaje de error completo.

