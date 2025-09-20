# 🚀 Proyectos de Ejemplo - R

## 📊 **Proyecto 1: Dashboard de Ventas**

### Descripción
Crear un dashboard interactivo que muestre las ventas mensuales de una empresa, incluyendo gráficos de tendencias, análisis por categorías y predicciones.

### Objetivos de Aprendizaje
- Manipulación de datos con dplyr
- Visualización con ggplot2
- Creación de dashboards con Shiny
- Análisis de series temporales

### Dataset
```r
# Crear datos de ejemplo
set.seed(123)
ventas <- data.frame(
  fecha = seq(as.Date("2024-01-01"), as.Date("2024-12-31"), by = "day"),
  categoria = sample(c("Electrónicos", "Ropa", "Hogar", "Deportes"), 366, replace = TRUE),
  ventas = round(runif(366, 1000, 5000), 2),
  clientes = sample(50:200, 366, replace = TRUE)
)

# Guardar datos
write.csv(ventas, "datasets/ventas_2024.csv", row.names = FALSE)
```

### Estructura del Proyecto
```
dashboard_ventas/
├── data/
│   └── ventas_2024.csv
├── scripts/
│   ├── 01_cargar_datos.R
│   ├── 02_analisis_tendencias.R
│   └── 03_crear_dashboard.R
├── output/
│   ├── graficos/
│   └── reportes/
└── app.R
```

### Código Principal
```r
# app.R
library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

# Cargar datos
ventas <- read.csv("data/ventas_2024.csv")
ventas$fecha <- as.Date(ventas$fecha)

# UI
ui <- fluidPage(
  titlePanel("Dashboard de Ventas 2024"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("categoria", "Categoría:", 
                  choices = unique(ventas$categoria)),
      dateRangeInput("fechas", "Rango de fechas:",
                     start = min(ventas$fecha),
                     end = max(ventas$fecha))
    ),
    
    mainPanel(
      plotlyOutput("grafico_ventas"),
      plotlyOutput("grafico_categorias"),
      verbatimTextOutput("resumen")
    )
  )
)

# Server
server <- function(input, output) {
  
  datos_filtrados <- reactive({
    ventas %>%
      filter(categoria == input$categoria,
             fecha >= input$fechas[1],
             fecha <= input$fechas[2])
  })
  
  output$grafico_ventas <- renderPlotly({
    datos <- datos_filtrados()
    
    p <- ggplot(datos, aes(x = fecha, y = ventas)) +
      geom_line(color = "blue") +
      geom_point(color = "red") +
      labs(title = paste("Ventas de", input$categoria),
           x = "Fecha", y = "Ventas ($)") +
      theme_minimal()
    
    ggplotly(p)
  })
  
  output$grafico_categorias <- renderPlotly({
    resumen <- ventas %>%
      filter(fecha >= input$fechas[1],
             fecha <= input$fechas[2]) %>%
      group_by(categoria) %>%
      summarise(total = sum(ventas))
    
    p <- ggplot(resumen, aes(x = categoria, y = total, fill = categoria)) +
      geom_col() +
      labs(title = "Ventas por Categoría",
           x = "Categoría", y = "Total ($)") +
      theme_minimal() +
      theme(legend.position = "none")
    
    ggplotly(p)
  })
  
  output$resumen <- renderText({
    datos <- datos_filtrados()
    paste("Total de ventas:", sum(datos$ventas),
          "\nPromedio diario:", round(mean(datos$ventas), 2),
          "\nDías analizados:", nrow(datos))
  })
}

# Ejecutar app
shinyApp(ui = ui, server = server)
```

---

## 🏥 **Proyecto 2: Análisis de Datos Médicos**

### Descripción
Analizar datos de pacientes para identificar factores de riesgo y patrones en diferentes condiciones médicas.

### Objetivos de Aprendizaje
- Análisis estadístico descriptivo
- Correlaciones y asociaciones
- Visualización de datos médicos
- Interpretación de resultados

### Dataset
```r
# Crear datos médicos de ejemplo
set.seed(456)
pacientes <- data.frame(
  id = 1:1000,
  edad = sample(18:80, 1000, replace = TRUE),
  peso = round(rnorm(1000, 70, 15), 1),
  altura = round(rnorm(1000, 170, 10), 1),
  diabetes = sample(c("No", "Si"), 1000, replace = TRUE, prob = c(0.8, 0.2)),
  hipertension = sample(c("No", "Si"), 1000, replace = TRUE, prob = c(0.75, 0.25)),
  colesterol = round(rnorm(1000, 200, 40), 1),
  ejercicio = sample(c("Sedentario", "Moderado", "Activo"), 1000, replace = TRUE)
)

# Calcular IMC
pacientes$imc <- round(pacientes$peso / ((pacientes$altura/100)^2), 1)

# Guardar datos
write.csv(pacientes, "datasets/pacientes.csv", row.names = FALSE)
```

### Análisis Principal
```r
# Cargar librerías
library(tidyverse)
library(ggplot2)
library(corrplot)

# Cargar datos
pacientes <- read.csv("datasets/pacientes.csv")

# Análisis exploratorio
summary(pacientes)

# Análisis de IMC por diabetes
ggplot(pacientes, aes(x = diabetes, y = imc, fill = diabetes)) +
  geom_boxplot() +
  labs(title = "IMC por Estado de Diabetes",
       x = "Diabetes", y = "IMC") +
  theme_minimal()

# Correlaciones
variables_numericas <- pacientes %>%
  select(edad, peso, altura, imc, colesterol) %>%
  cor()

corrplot(variables_numericas, method = "circle", type = "upper")

# Análisis de riesgo
riesgo <- pacientes %>%
  group_by(diabetes, hipertension) %>%
  summarise(
    n = n(),
    imc_promedio = mean(imc),
    colesterol_promedio = mean(colesterol),
    edad_promedio = mean(edad)
  )

print(riesgo)
```

---

## 📈 **Proyecto 3: Predicción de Precios de Vivienda**

### Descripción
Desarrollar un modelo de machine learning para predecir precios de viviendas basado en características como tamaño, ubicación y amenities.

### Objetivos de Aprendizaje
- Regresión lineal múltiple
- Validación cruzada
- Métricas de evaluación
- Visualización de resultados

### Dataset
```r
# Crear datos de viviendas
set.seed(789)
viviendas <- data.frame(
  precio = round(runif(500, 100000, 800000), 0),
  area = sample(50:300, 500, replace = TRUE),
  habitaciones = sample(1:6, 500, replace = TRUE),
  banos = sample(1:4, 500, replace = TRUE),
  garaje = sample(c("Si", "No"), 500, replace = TRUE, prob = c(0.7, 0.3)),
  piscina = sample(c("Si", "No"), 500, replace = TRUE, prob = c(0.3, 0.7)),
  ubicacion = sample(c("Centro", "Suburbio", "Rural"), 500, replace = TRUE)
)

# Ajustar precios según características
viviendas$precio <- viviendas$precio + 
  viviendas$area * 1000 + 
  viviendas$habitaciones * 20000 +
  viviendas$banos * 15000 +
  ifelse(viviendas$garaje == "Si", 30000, 0) +
  ifelse(viviendas$piscina == "Si", 50000, 0)

write.csv(viviendas, "datasets/viviendas.csv", row.names = FALSE)
```

### Modelo de Predicción
```r
library(caret)
library(randomForest)

# Cargar datos
viviendas <- read.csv("datasets/viviendas.csv")

# Preparar datos para modelado
datos_modelo <- viviendas %>%
  mutate(
    garaje = as.factor(garaje),
    piscina = as.factor(piscina),
    ubicacion = as.factor(ubicacion)
  )

# Dividir datos
set.seed(123)
indices <- createDataPartition(datos_modelo$precio, p = 0.8, list = FALSE)
entrenamiento <- datos_modelo[indices, ]
prueba <- datos_modelo[-indices, ]

# Entrenar modelo
modelo <- train(
  precio ~ area + habitaciones + banos + garaje + piscina + ubicacion,
  data = entrenamiento,
  method = "lm",
  trControl = trainControl(method = "cv", number = 10)
)

# Hacer predicciones
predicciones <- predict(modelo, prueba)

# Evaluar modelo
rmse <- sqrt(mean((prueba$precio - predicciones)^2))
r2 <- cor(prueba$precio, predicciones)^2

cat("RMSE:", rmse, "\n")
cat("R²:", r2, "\n")

# Visualizar resultados
resultados <- data.frame(
  real = prueba$precio,
  predicho = predicciones
)

ggplot(resultados, aes(x = real, y = predicho)) +
  geom_point(alpha = 0.6) +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  labs(title = "Precios Reales vs Predichos",
       x = "Precio Real ($)", y = "Precio Predicho ($)") +
  theme_minimal()
```

---

## 📊 **Proyecto 4: Análisis de Sentimientos en Redes Sociales**

### Descripción
Analizar el sentimiento de tweets relacionados con una marca o tema específico usando técnicas de procesamiento de lenguaje natural.

### Objetivos de Aprendizaje
- Procesamiento de texto
- Análisis de sentimientos
- Visualización temporal
- APIs de redes sociales

### Código Principal
```r
library(rtweet)
library(tidyverse)
library(tidytext)
library(wordcloud)

# Obtener tweets (requiere autenticación)
tweets <- search_tweets("#rstats", n = 1000, include_rts = FALSE)

# Análisis de sentimientos
library(syuzhet)

# Obtener sentimientos
sentimientos <- get_sentiment(tweets$text, method = "nrc")

# Crear dataframe con sentimientos
tweets_sentimientos <- data.frame(
  texto = tweets$text,
  sentimiento = sentimientos,
  fecha = as.Date(tweets$created_at)
)

# Análisis temporal
sentimientos_diarios <- tweets_sentimientos %>%
  group_by(fecha) %>%
  summarise(
    sentimiento_promedio = mean(sentimiento),
    n_tweets = n()
  )

# Visualizar tendencia
ggplot(sentimientos_diarios, aes(x = fecha, y = sentimiento_promedio)) +
  geom_line(color = "blue") +
  geom_smooth(method = "loess", color = "red") +
  labs(title = "Tendencia de Sentimientos en Tweets sobre #rstats",
       x = "Fecha", y = "Sentimiento Promedio") +
  theme_minimal()

# Word cloud de palabras más frecuentes
library(wordcloud)

palabras <- tweets_sentimientos %>%
  unnest_tokens(palabra, texto) %>%
  anti_join(stop_words) %>%
  count(palabra, sort = TRUE) %>%
  head(100)

wordcloud(palabras$palabra, palabras$n, max.words = 50, random.order = FALSE)
```

---

## 🎯 **Proyecto 5: Sistema de Recomendaciones**

### Descripción
Crear un sistema básico de recomendaciones basado en filtrado colaborativo para sugerir productos a usuarios.

### Objetivos de Aprendizaje
- Algoritmos de recomendación
- Filtrado colaborativo
- Medidas de similitud
- Evaluación de sistemas

### Dataset y Código
```r
# Crear datos de ratings
set.seed(101)
usuarios <- 100
productos <- 50

ratings <- expand.grid(usuario = 1:usuarios, producto = 1:productos)
ratings$rating <- sample(c(NA, 1:5), nrow(ratings), replace = TRUE, prob = c(0.7, 0.06, 0.06, 0.06, 0.06, 0.06))

# Eliminar ratings NA
ratings <- ratings[!is.na(ratings$rating), ]

# Función de recomendación simple
recomendar <- function(matriz_ratings, usuario_id, n_recomendaciones = 5) {
  
  # Calcular similitud coseno entre usuarios
  similitud <- function(u1, u2) {
    productos_comunes <- intersect(
      matriz_ratings[matriz_ratings$usuario == u1, "producto"],
      matriz_ratings[matriz_ratings$usuario == u2, "producto"]
    )
    
    if (length(productos_comunes) == 0) return(0)
    
    ratings_u1 <- matriz_ratings[matriz_ratings$usuario == u1 & 
                                matriz_ratings$producto %in% productos_comunes, "rating"]
    ratings_u2 <- matriz_ratings[matriz_ratings$usuario == u2 & 
                                matriz_ratings$producto %in% productos_comunes, "rating"]
    
    sum(ratings_u1 * ratings_u2) / (sqrt(sum(ratings_u1^2)) * sqrt(sum(ratings_u2^2)))
  }
  
  # Encontrar usuarios similares
  otros_usuarios <- unique(matriz_ratings$usuario)
  otros_usuarios <- otros_usuarios[otros_usuarios != usuario_id]
  
  similitudes <- sapply(otros_usuarios, function(u) similitud(usuario_id, u))
  
  # Obtener productos no calificados por el usuario
  productos_usuario <- matriz_ratings[matriz_ratings$usuario == usuario_id, "producto"]
  productos_disponibles <- setdiff(1:max(matriz_ratings$producto), productos_usuario)
  
  # Calcular scores de recomendación
  scores <- sapply(productos_disponibles, function(p) {
    usuarios_que_calificaron <- matriz_ratings[matriz_ratings$producto == p, "usuario"]
    if (length(usuarios_que_calificaron) == 0) return(0)
    
    similitudes_relevantes <- similitudes[otros_usuarios %in% usuarios_que_calificaron]
    ratings_relevantes <- matriz_ratings[matriz_ratings$producto == p & 
                                        matriz_ratings$usuario %in% otros_usuarios, "rating"]
    
    sum(similitudes_relevantes * ratings_relevantes) / sum(abs(similitudes_relevantes))
  })
  
  # Retornar mejores recomendaciones
  orden <- order(scores, decreasing = TRUE)
  productos_disponibles[orden[1:n_recomendaciones]]
}

# Probar sistema
recomendaciones <- recomendar(ratings, usuario_id = 1, n_recomendaciones = 5)
cat("Productos recomendados para usuario 1:", recomendaciones, "\n")
```

---

## 💡 **Consejos para Implementar Proyectos**

### 1. **Planificación**
- Define objetivos claros
- Identifica los datos necesarios
- Establece métricas de éxito

### 2. **Desarrollo Iterativo**
- Empieza con versiones simples
- Agrega complejidad gradualmente
- Prueba cada componente por separado

### 3. **Documentación**
- Comenta tu código extensivamente
- Documenta decisiones de diseño
- Mantén un README actualizado

### 4. **Versionado**
- Usa Git para control de versiones
- Haz commits frecuentes y descriptivos
- Mantén un historial claro

### 5. **Testing**
- Valida resultados con datos conocidos
- Prueba casos extremos
- Verifica que el código sea reproducible

---

**🚀 ¡Estos proyectos te ayudarán a desarrollar habilidades prácticas en R mientras construyes un portafolio impresionante!**
