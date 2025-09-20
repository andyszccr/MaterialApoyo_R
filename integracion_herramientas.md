# 🔗 Integración de R con Otras Herramientas

## 🐍 **Integración con Python**

### Reticulate Package
```r
# Instalar y cargar reticulate
install.packages("reticulate")
library(reticulate)

# Usar Python desde R
py_run_string("import pandas as pd")
py_run_string("df = pd.read_csv('datos.csv')")

# Convertir entre R y Python
r_data <- data.frame(x = 1:5, y = 6:10)
py_data <- r_to_py(r_data)
py_run_string("print(df.head())")
```

### Jupyter Notebooks
```r
# Instalar IRkernel para Jupyter
install.packages("IRkernel")
IRkernel::installspec()

# Crear notebook R en Jupyter
# jupyter notebook --generate-config
# Luego crear .ipynb con kernel R
```

### Datasets Compartidos
```r
# R a Python (vía CSV)
write.csv(mtcars, "datos_r.csv", row.names = FALSE)

# Python a R (vía CSV)
datos_python <- read.csv("datos_python.csv")

# Usando feather para mayor eficiencia
library(feather)
write_feather(mtcars, "datos.feather")
# En Python: pd.read_feather("datos.feather")
```

## 🗄️ **Bases de Datos**

### MySQL/MariaDB
```r
# Conectar a MySQL
library(RMySQL)
con <- dbConnect(MySQL(),
                 user = "usuario",
                 password = "contraseña",
                 dbname = "base_datos",
                 host = "localhost")

# Ejecutar consultas
resultado <- dbGetQuery(con, "SELECT * FROM tabla LIMIT 10")
dbDisconnect(con)
```

### PostgreSQL
```r
# Conectar a PostgreSQL
library(RPostgreSQL)
con <- dbConnect(PostgreSQL(),
                 user = "usuario",
                 password = "contraseña",
                 dbname = "base_datos",
                 host = "localhost")

# Usar DBI para consultas
library(DBI)
datos <- dbGetQuery(con, "SELECT * FROM ventas WHERE fecha >= '2024-01-01'")
```

### SQLite
```r
# SQLite (archivo local)
library(RSQLite)
con <- dbConnect(SQLite(), "mi_base_datos.db")

# Crear tabla
dbWriteTable(con, "mtcars", mtcars)

# Consultar datos
resultado <- dbGetQuery(con, "SELECT * FROM mtcars WHERE mpg > 20")
```

## ☁️ **APIs y Servicios Web**

### APIs REST
```r
# Usar httr para APIs
library(httr)

# Ejemplo: API de GitHub
response <- GET("https://api.github.com/users/hadleywickham")
datos <- content(response, "parsed")

# Ejemplo: API de datos financieros
library(jsonlite)
url <- "https://api.example.com/stock/AAPL"
datos <- fromJSON(url)
```

### Twitter API
```r
# Análisis de tweets
library(rtweet)

# Obtener tweets
tweets <- search_tweets("#rstats", n = 100)

# Análisis de sentimientos
library(syuzhet)
sentimientos <- get_sentiment(tweets$text)
```

### Google Sheets
```r
# Conectar con Google Sheets
library(googlesheets4)

# Leer datos
datos <- read_sheet("1ABC123...", sheet = "Hoja1")

# Escribir datos
write_sheet(mtcars, "1ABC123...", sheet = "NuevaHoja")
```

## 📊 **Herramientas de BI**

### Power BI
```r
# Crear datasets para Power BI
library(openxlsx)

# Exportar a Excel
write.xlsx(mtcars, "datos_powerbi.xlsx")

# Usar R scripts en Power BI
# En Power BI: Transform > Run R script
```

### Tableau
```r
# Preparar datos para Tableau
library(foreign)

# Exportar a formato compatible
write.dta(mtcars, "datos_tableau.dta")
write.csv(mtcars, "datos_tableau.csv")

# Conectar directamente (requiere Tableau Server)
library(Rserve)
Rserve(args = "--vanilla")
```

### QlikView/QlikSense
```r
# Exportar datos para Qlik
library(readr)

# Formato optimizado para Qlik
write_csv(mtcars, "datos_qlik.csv")

# Usar R en QlikView
# En QlikView: Script > Load > R
```

## 🌐 **Desarrollo Web**

### Shiny Applications
```r
# Crear aplicación Shiny
library(shiny)

ui <- fluidPage(
  titlePanel("Mi App Shiny"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Variable:", names(mtcars))
    ),
    mainPanel(
      plotOutput("grafico")
    )
  )
)

server <- function(input, output) {
  output$grafico <- renderPlot({
    plot(mtcars[[input$variable]])
  })
}

# Ejecutar aplicación
shinyApp(ui = ui, server = server)
```

### R Markdown para Web
```r
# Crear sitio web con R Markdown
library(rmarkdown)
library(flexdashboard)

# Crear dashboard
# ---
# title: "Mi Dashboard"
# output: flexdashboard::flex_dashboard
# ---

# Renderizar a HTML
render("dashboard.Rmd")
```

### APIs con plumber
```r
# Crear API REST con plumber
library(plumber)

# Crear endpoint
#* @get /promedio
#* @param x:numeric
promedio <- function(x) {
  mean(x)
}

# Ejecutar API
pr("api.R") %>% pr_run(port = 8000)
```

## 📱 **Aplicaciones Móviles**

### Shiny Mobile
```r
# Optimizar Shiny para móviles
library(shinymobile)

ui <- f7Page(
  title = "Mi App Móvil",
  f7TabLayout(
    panels = tagList(
      f7Panel(title = "Panel", side = "left", theme = "light")
    ),
    navbar = f7Navbar(
      title = "Mi App",
      hairline = TRUE,
      shadow = TRUE
    )
  )
)
```

### Capacitor Integration
```r
# Integrar con Capacitor para apps nativas
# Crear build de Shiny para web
# Luego usar Capacitor para empaquetar como app móvil
```

## 🔄 **Automatización y Scheduling**

### Cron Jobs (Linux/Mac)
```bash
# Configurar tarea cron
# Editar crontab
crontab -e

# Ejecutar script R cada día a las 9 AM
0 9 * * * /usr/bin/Rscript /ruta/a/mi_script.R
```

### Task Scheduler (Windows)
```r
# Crear script para Task Scheduler
# En Windows: Task Scheduler > Create Basic Task

# Script R que se ejecuta automáticamente
setwd("C:/ruta/a/proyecto")
source("analisis_diario.R")
```

### GitHub Actions
```yaml
# .github/workflows/r-analysis.yml
name: R Analysis

on:
  schedule:
    - cron: '0 9 * * *'  # Diario a las 9 AM

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: r-lib/actions/setup-r@v1
    - name: Install packages
      run: Rscript -e "install.packages(c('tidyverse', 'ggplot2'))"
    - name: Run analysis
      run: Rscript analisis.R
```

## 🐳 **Docker y Contenedores**

### Dockerfile para R
```dockerfile
FROM rocker/tidyverse:latest

# Instalar paquetes adicionales
RUN R -e "install.packages(c('shiny', 'plotly'))"

# Copiar archivos del proyecto
COPY . /home/rstudio/proyecto
WORKDIR /home/rstudio/proyecto

# Exponer puerto para Shiny
EXPOSE 3838

# Comando por defecto
CMD ["R", "-e", "shiny::runApp(port=3838, host='0.0.0.0')"]
```

### Docker Compose
```yaml
version: '3.8'
services:
  r-app:
    build: .
    ports:
      - "3838:3838"
    volumes:
      - ./datos:/home/rstudio/datos
    environment:
      - R_LIBS_USER=/home/rstudio/R_libs
```

## ☁️ **Cloud Computing**

### AWS
```r
# Usar AWS S3
library(aws.s3)

# Subir archivo
put_object("mi_archivo.csv", 
           bucket = "mi-bucket", 
           object = "datos/mi_archivo.csv")

# Descargar archivo
s3read_using(read.csv, 
             bucket = "mi-bucket", 
             object = "datos/mi_archivo.csv")
```

### Google Cloud
```r
# Usar Google Cloud Storage
library(googleCloudStorageR)

# Autenticar
gcs_auth("path/to/service-account.json")

# Subir archivo
gcs_upload("mi_archivo.csv", bucket = "mi-bucket")
```

### Azure
```r
# Usar Azure Blob Storage
library(AzureStor)

# Conectar
endp <- storage_endpoint("https://mystorage.blob.core.windows.net/", key="access_key")
cont <- storage_container(endp, "mi-container")

# Subir archivo
storage_upload(cont, "mi_archivo.csv", "datos/mi_archivo.csv")
```

## 🔧 **Herramientas de Desarrollo**

### Git Integration
```r
# Usar git2r para control de versiones
library(git2r)

# Inicializar repositorio
repo <- init(".")

# Agregar archivos
add(repo, "*.R")
commit(repo, "Agregar scripts R")
```

### VS Code Integration
```r
# Configurar VS Code para R
# Instalar extension "R" de REditorSupport
# Configurar settings.json:

{
    "r.rterm.windows": "C:\\Program Files\\R\\R-4.1.0\\bin\\R.exe",
    "r.rpath.windows": "C:\\Program Files\\R\\R-4.1.0\\bin\\R.exe",
    "r.rterm.option": ["--no-restore", "--no-save"]
}
```

### GitHub Integration
```r
# Usar usethis para GitHub
library(usethis)

# Crear proyecto
create_project("mi-proyecto-r")

# Crear repositorio GitHub
use_github()
```

---

**💡 Consejo:** La integración exitosa depende de entender bien tanto R como la herramienta con la que te integras. Siempre revisa la documentación oficial de ambas tecnologías.
