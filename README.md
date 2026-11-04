# Material de apoyo en R

Este material es para quien empieza R desde cero: estudiantes y cualquier persona que quiera leer datos, limpiarlos, graficarlos y contar qué encontró. Se estudia en RStudio, un script detrás de otro, en el orden de las carpetas.

Al terminarlo puedes abrir un CSV, resumirlo, hacer un gráfico con título y ejes, y cerrar con una conclusión escrita en tus palabras.

R es el lenguaje: hace las cuentas y los gráficos. RStudio es el programa donde escribes ese lenguaje y ves el resultado. Esta carpeta es el cuaderno: ejercicios comentados, datos y dos proyectos ya armados.

## Primera sesión

Necesitas R 4.0 o superior, RStudio Desktop (gratis) y conexión a internet solo la primera vez, para bajar paquetes.

1. Instala R desde [CRAN](https://cran.r-project.org/). En Windows: *Download R for Windows*, luego *base*, y acepta las opciones del instalador. En macOS baja el archivo `.pkg`. En Ubuntu o Debian: `sudo apt update` y `sudo apt install r-base r-base-dev`.
2. Instala [RStudio Desktop](https://posit.co/download/rstudio-desktop/). Ábrelo después de instalar R, no antes.
3. En RStudio elige **File > Open Folder** y selecciona esta carpeta, `MaterialApoyo_R`.

La ventana queda en cuatro zonas. Conviene reconocerlas antes de escribir nada:

| Zona | Para qué sirve |
| --- | --- |
| Arriba a la izquierda | El script. Ahí está el código que guardas en un archivo `.R`. |
| Abajo a la izquierda | La consola. Ahí responde R cuando ejecutas una línea. |
| Arriba a la derecha | El entorno. La lista de objetos que acabas de crear (vectores, tablas). |
| Abajo a la derecha | Gráficos, archivos de la carpeta y la ayuda. |

Para correr una línea, haz clic sobre ella y pulsa **Ctrl + Enter** (en Mac, **Cmd + Enter**). Lee el comentario de encima, mira qué apareció en la consola y pasa a la siguiente. Si el resultado es un gráfico, se abre la pestaña **Plots**.

El directorio de trabajo es la carpeta desde la que R busca los archivos. Tiene que ser la raíz de este material. Compruébalo así:

```r
getwd()
```

La ruta debe terminar en `MaterialApoyo_R`. Si termina en otra carpeta, ve a **Session > Set Working Directory > Choose Directory** y elige esta. Si no, `read.csv("datasets/ventas_tienda.csv")` no encuentra el archivo.

Instala los paquetes una sola vez, con ese directorio ya correcto:

```r
source("config/install_packages.R")
```

Eso baja lo que usan los ejercicios: tidyverse (incluye `dplyr` y `ggplot2`), `plotly` para gráficos interactivos, y paquetes de modelos como `caret` y `rpart`. La primera vez tarda varios minutos. Si pregunta si quieres compilar desde las fuentes, puedes responder que no.

En **Tools > Global Options > General** deja sin marcar *Restore .RData into workspace at startup* y pon *Save workspace* en *Never*. Cada vez que abras RStudio empiezas vacío, y el resultado sale del script que estás viendo.

### Si algo falla

| Qué ves | Qué hacer |
| --- | --- |
| RStudio abre y la consola dice que no encuentra R | Cierra RStudio, confirma que R quedó instalado y vuelve a abrirlo. |
| `there is no package called ...` | Vuelve a correr `source("config/install_packages.R")` con internet. Para uno solo: `install.packages("tidyverse")`. |
| `cannot open file` o no encuentra un CSV | `getwd()` no apunta a `MaterialApoyo_R`. Cámbialo con **Session > Set Working Directory**. |
| La consola muestra un error en rojo y no pasa nada | Lee la última línea del mensaje. Casi siempre es un paréntesis sin cerrar, una coma de más o un nombre mal escrito. |
| Un gráfico no aparece | Revisa la pestaña **Plots**, abajo a la derecha. A veces quedó detrás de **Help** o **Files**. |

La ayuda de una función se abre escribiendo `?mean` en la consola. `sessionInfo()` dice qué versión de R y qué paquetes tienes cargados.

## En qué orden estudiar

Abre los archivos en este orden. Cada uno supone el anterior. Una sesión de media hora, ejecutando línea a línea, rinde más que leerlos todos de corrido.

1. `01_Introduccion_R/ejercicios_basicos/Numeros.R` — cuentas, `if` y bucles.
2. En la misma carpeta: `vectores.R`, `listas.R` y `funciones.R`.
3. `01_Introduccion_R/condicionales.R` y `bucles.R`.
4. `01_Introduccion_R/factores_y_datos/03 DataFrame Clase 7.R` — la primera tabla.
5. `01_Introduccion_R/ejercicios_progresivos/ejercicio_1_basico.R` y, cuando ya te sientas suelto, `ejercicios_basicos/01 Practica_ejercicios.R`.
6. `02_Manipulacion_Datos/dataframes/04 Leer un csv.R` y después `limpieza_datos/Practica stringr - lubridate.R`.
7. `03_Visualizacion/plot/`, del `01_grafico_linea.R` al `07_ggplot2_intro.R`. Luego practica con los de `03_Visualizacion/graficos/`.
8. `05_Analisis_Exploratorio/practicas_eda/Practica EDA.R`.
9. `04_Modelado/clustering/kmeans.r`.
10. Los proyectos de `proyectos_finales/`: primero el gimnasio, después el árbol del Titanic.

La guía corta de comandos, para copiar cuando no recuerdas la sintaxis, está en `01_Introduccion_R/guia_referencia_rapida.md`.

| Nivel | Qué ya sabes hacer | Listo cuando… |
| --- | --- | --- |
| 1. Fundamentos | Operaciones, variables, vectores y funciones como `sum` y `mean` | Corriste `Numeros.R`, `vectores.R` y `listas.R` línea a línea |
| 2. Datos | Abrir un CSV, filtrar filas y crear una columna | Usaste un archivo de `datasets/` y explicas qué hay en cada columna |
| 3. Gráficos | Línea, barra, histograma, dispersión, caja y un `ggplot` con título | Hiciste los siete scripts de `03_Visualizacion/plot/` y sabes qué pregunta responde cada gráfico |
| 4. Estadística | Media, dispersión, correlación y un agrupamiento simple | Contaste un resultado de `Practica EDA.R` con tus palabras |
| 5. Proyecto | Pregunta, limpieza, gráfico y conclusión en un solo script | Leíste el proyecto del gimnasio y el del Titanic, y armaste el tuyo |

Tres ritmos posibles, si estudias varias veces por semana:

- **Dos a cuatro semanas.** Pasos 1 a 5 y un gráfico de `plot/`.
- **Dos a tres meses.** El orden completo y uno de los proyectos finales.
- **Un semestre.** Todo lo anterior, un reporte con una plantilla de `templates/` y la lectura de *R for Data Science*.

## Qué hay en cada carpeta

```
MaterialApoyo_R/
├── 01_Introduccion_R/        # Cómo se escribe R
├── 02_Manipulacion_Datos/    # Tablas, CSV y limpieza
├── 03_Visualizacion/         # Gráficos, en plot/ y en graficos/
├── 04_Modelado/              # Agrupar datos (clustering)
├── 05_Analisis_Exploratorio/ # Describir un dataset antes de modelar
├── datasets/                 # Los CSV de práctica
├── proyectos_finales/        # Gimnasio y Titanic, ya escritos
├── config/                   # Instala los paquetes
├── templates/                # Moldes de reporte y tablero
└── documentacion/            # Notas de apoyo
```

**01. Introducción.** Operaciones, variables, vectores, listas, factores, funciones, condicionales y bucles. Un vector guarda varios valores del mismo tipo: `c(140, 98, 121)`. Un factor es una categoría con opciones fijas, por ejemplo `"Si"` y `"No"`.

**02. Manipulación de datos.** Un data frame es la tabla de trabajo: cada fila es un caso y cada columna una variable. Aquí se leen CSV, se eligen columnas, se filtran filas y se crean columnas nuevas. `dplyr` nombra esos pasos (`filter`, `select`, `mutate`, `group_by`, `summarise`). `stringr` limpia texto y `lubridate` trabaja con fechas.

**03. Visualización.** La carpeta `plot/` va de uno en uno: línea, barra, histograma, dispersión, caja, torta y la primera figura con `ggplot2`. `ggplot2` arma el gráfico por capas: los datos, qué variable va en cada eje (`aes`) y la forma (`geom_point`, `geom_col`, `geom_boxplot`). `plotly`, en `graficos/`, deja hacer zoom y ver el valor al pasar el cursor.

**04. Modelado.** `kmeans.r` agrupa filas parecidas entre sí. Esa técnica se llama clustering. El árbol de decisión, que clasifica casos, está en el proyecto del Titanic.

**05. Análisis exploratorio.** Antes de modelar se describe el dataset: medias, dispersión, distribuciones, valores atípicos y relaciones entre variables. A eso se le llama EDA.

**Proyectos finales.** Dos análisis cerrados, para leer cuando ya pasaste por gráficos y por el EDA.

- `02 Proyecto Final Gimnasio.R` usa `datasets/gym_members_exercise_tracking.csv`: describe, correlaciona y grafica.
- `03  Arbol de desición Titanic.R` ajusta un árbol para estimar si un pasajero sobrevivió.

En `templates/` hay tres archivos R Markdown (análisis, tablero y presentación) para pasar tu propio script a un documento.

## Palabras que aparecen en los scripts

| Término | Significado |
| --- | --- |
| Objeto | Lo que R guarda en memoria con un nombre: un número, un vector, una tabla. Lo ves en el entorno, arriba a la derecha. |
| Variable | El nombre de ese objeto. Se crea con `<-`, como en `ventas <- c(140, 98, 121)`. |
| Vector | Varios valores del mismo tipo en una sola variable. |
| Matriz | Tabla en la que todas las celdas son del mismo tipo. |
| Data frame | Tabla de análisis. Las columnas pueden ser de distinto tipo. |
| Factor | Categoría con niveles definidos. Sirve en gráficos y en modelos. |
| Función | Una acción con nombre. `mean(x)` calcula el promedio de `x`. |
| Argumento | Lo que le pasas a una función. En `mean(x, na.rm = TRUE)`, `na.rm = TRUE` le dice que ignore los huecos. |
| Script | El archivo `.R`. Se puede volver a ejecutar. Lo que escribes solo en la consola se pierde al cerrar. |
| Paquete | Un grupo de funciones que se instala desde CRAN y se activa con `library(dplyr)`. |
| Base R | Lo que ya viene instalado: `mean`, `plot`, `read.csv`. No hace falta `library`. |
| Tidyverse | La familia de paquetes que se usa en este curso para tablas y gráficos. |
| Pipe `%>%` | Encadena pasos. Se lee "y luego": la tabla de la izquierda entra en la función de la derecha. |
| dplyr | Filtra, elige columnas, crea columnas y resume tablas. |
| ggplot2 | Gráficos por capas. |
| EDA | Mirar y resumir los datos antes de proponer un modelo. |
| Estadística descriptiva | Media, mediana, mínimo, máximo y desviación. |
| Histograma | Cómo se reparte una variable numérica, en intervalos. |
| Clustering | Juntar filas parecidas cuando todavía no hay una etiqueta de grupo. |
| String | Un texto, siempre entre comillas. |
| NA | Un dato que falta. No es un cero. Muchas funciones se detienen si no les dices qué hacer con él. |

## Datos para practicar

Están en `datasets/`, en CSV. Ábrelos desde la raíz del material:

```r
ventas <- read.csv("datasets/ventas_tienda.csv")
head(ventas)     # las primeras filas
str(ventas)      # el tipo de cada columna
summary(ventas)  # un resumen numérico
```

`head` confirma que el archivo cargó. `str` dice si una columna es texto o número. `summary` da mínimo, mediana y máximo.

| Archivo | Para qué usarlo |
| --- | --- |
| `ventas_tienda.csv` | Ventas por producto y categoría. Barras y tendencias. |
| `datos_medicos.csv` | Pacientes. Comparar grupos. |
| `viviendas.csv` | Precio y características de viviendas. |
| `encuesta_satisfaccion.csv` | Respuestas de una encuesta. Conteos por categoría. |
| `rendimiento_academico.csv` | Calificaciones y asistencia. |
| `students_with_dates.csv` | Fechas, para practicar `lubridate`. |
| `gym_members_exercise_tracking.csv` | El proyecto del gimnasio. |
| `census-retail.csv` | Limpieza de un archivo más sucio. |
| `BikeData.csv` | Otro conjunto para gráficos y exploración. |

Algunos CSV traen celdas vacías a propósito. En R esas celdas se leen como `NA`. R también trae dos tablas sin descargar nada, `mtcars` e `iris`, útiles para probar un gráfico en pocas líneas.

## Ideas de proyecto

Estos cinco no están escritos como script. Son encargos para hacer tú, cuando termines el orden de arriba. Los tres primeros usan CSV que sí están en `datasets/`.

1. **Ventas.** Con `ventas_tienda.csv`, filtra una categoría, suma el total y haz un gráfico de tendencia.
2. **Datos médicos.** Con `datos_medicos.csv`, compara grupos y mira qué variables se mueven juntas.
3. **Viviendas.** Con `viviendas.csv`, relaciona el precio con el tamaño u otra característica.
4. **Texto.** Parte frases en palabras y cuenta cuáles se repiten. Pide paquetes que el curso base no usa.
5. **Recomendaciones.** A partir de usuario, producto y calificación, sugiere productos parecidos. Es el más largo.

Un encargo está cerrado cuando tiene una pregunta al inicio, los datos limpios, un gráfico que responde esa pregunta y un párrafo de conclusión al final. Empieza por cargar, resumir y graficar. El modelo va después.

Para ver cómo se ve un análisis ya cerrado, abre los dos scripts de `proyectos_finales/` después de los niveles 3 y 4.

## Después del curso

Esta parte no hace falta para aprobar los ejercicios. Sirve cuando ya lees un script sin detenerte en cada línea y quieres conectar R con otra herramienta.

| Quieres… | Cómo se hace en R |
| --- | --- |
| Pasar una tabla a Excel, Python o Power BI | Guárdala en CSV. El otro programa la abre. |
| Leer una base de datos | El paquete `DBI`, con `RSQLite` si la base es un solo archivo. El resultado llega como data frame. |
| Pedir datos a una página | `httr` y `jsonlite` leen una dirección web y convierten la respuesta en tabla. |
| Publicar un gráfico con filtros | `shiny`: una pantalla con controles y un gráfico que se recalcula. |
| Entregar un reporte | `rmarkdown` mezcla texto y código y lo exporta a HTML, PDF o Word. Las plantillas están en `templates/`. |
| Guardar el historial de cambios | Git, desde el panel de RStudio. Cada commit anota qué cambió. |

El intercambio más simple es un CSV:

```r
write.csv(mtcars, "mtcars.csv", row.names = FALSE)
datos <- read.csv("mtcars.csv")
```

Cuando un ejercicio se quede corto:

- [R for Data Science](https://r4ds.had.co.nz/), gratis, en el mismo orden que este material: datos, gráficos y modelos.
- [R Programming](https://www.coursera.org/learn/r-programming), de Johns Hopkins, en Coursera.
- Hojas de una página: [R en español](https://rstudio.github.io/cheatsheets/translations/spanish/r-base-espanol.pdf), [dplyr](https://dplyr.tidyverse.org/) y [ggplot2](https://ggplot2.tidyverse.org/).
- Para preguntar: [RStudio Community](https://community.rstudio.com/) y [Stack Overflow, etiqueta r](https://stackoverflow.com/questions/tagged/r). Incluye qué hiciste, qué esperabas y el mensaje de error completo.
- Para practicar con datos nuevos cada semana: [Tidy Tuesday](https://github.com/rfordatascience/tidytuesday).
- En YouTube, StatQuest explica la estadística con calma. En español, los canales de ciencia de datos de Latam cubren tidyverse y gráficos.

Textos de fondo, por si un docente los pide: Wickham (2014), *Tidy Data*, Journal of Statistical Software; Wickham (2016), *ggplot2*, Springer; Wilkinson (2005), *The Grammar of Graphics*, Springer; Kabacoff, *R in Action*, Manning.

## Para probar que ya quedó instalado

Pega esto en un script nuevo, guarda el archivo dentro de la carpeta del material y ejecútalo con Ctrl + Enter, línea a línea.

```r
ventas <- c(140, 98, 121, 201, 213)
names(ventas) <- c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes")

mean(ventas)
sum(ventas)

barplot(ventas,
        main = "Venta de lápices",
        ylab = "Unidades",
        col = "steelblue")
```

Si el promedio aparece en la consola y el gráfico de barras aparece en **Plots**, la instalación está lista. El mismo ciclo (guardar, resumir, mostrar) es el de todo el material.
