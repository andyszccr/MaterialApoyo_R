#Expectativa de vida del mundo
# Análisis de la expectativa de vida basado en la base de datos Gapminder. 
# Se exploran patrones globales y regionales de la expectativa de vida a lo largo del tiempo. 
# Se utilizan diversas técnicas de visualización para representar los datos de manera efectiva. 
# Los resultados muestran un aumento general de la expectativa de vida en todos los países y destacan las diferencias entre continentes. 
# Las palabras clave son expectativa de vida, Gapminder, tendencias temporales, visualización de datos, análisis global.



#Cargamos todas las librarias que necesitaremos
library(NbClust)
library(factoextra)
library(mvtnorm)
library(dendextend)
library(dplyr)
library(ggplot2)
library(plotly) #install.packages("plotly")
library(mice)   #install.packages("mice")
library(gapminder)



#Creamos un Dataset gapminder para nuestra base de datos
gapminder <- gapminder



#Creamos un data set con los datos del 1997 en adelante
gapminder_TenYears <- gapminder[gapminder$year >=1997,]



#Hacemos un histograma para detectar outliers en el life expectancy.
x11()
hist(gapminder$lifeExp)
#Se realiza un histograma de la variable expectativa de vida del conjunto de datos “gapminder”. 
#El propósito de este histograma es identificar posibles valores atípicos o outliers en la distribución de la expectativa de vida.
#Al observar el histograma, podemos identificar si hay valores extremos que se desvían significativamente de la distribución general de la expectativa de vida. 
#Estos valores atípicos pueden indicar casos excepcionales o errores en los datos.


#Estadistica de boxplot para que nos deje saber cuantos outliers tenemos

boxplot.stats(gapminder$lifeExp)

#Optener un summary de nuestra data
summary(gapminder)
#Se utiliza la función “summary” en el conjunto de datos “gapminder”.
#Este resumen proporciona una visión general de las variables presentes en el conjunto de datos, incluyendo medidas estadísticas clave para cada una de ellas.



#Analisis de Correlacion
cor(gapminder[, sapply(gapminder, is.numeric)], use = "complete.obs")
#El análisis de correlación en el conjunto de datos “gapminder” evalúa las relaciones entre las variables numéricas.
#Se calculan coeficientes de correlación para todas las combinaciones posibles de pares de variables.



# Calculate the average life expectancy by continent and year
gapminder_avg <- gapminder %>%
  group_by(year, continent) %>%
  summarize(avg_lifeExp = mean(lifeExp))

# Print the resulting data frame
print(gapminder_avg)
#Calculamos el promedio de expectativa de vida y generamos una tabla que contiene los valores promedio de la expectativa de vida agrupados por año y continente. 
#Se debe aclarar que en esta imagen simplemente se muestran 10 de los resultados del data frame, existen exactamente 1,704 datos.


#Visualiuzacion
# Calcular la expectativa de vida promedio por continente
vida_promedio <- gapminder %>%
  group_by(continent) %>%
  summarize(avg_lifeExp = mean(lifeExp))

# Crear el gráfico interactivo de barras
fig <- plot_ly(data = vida_promedio, x = ~continent, y = ~avg_lifeExp,
               type = "bar", color = ~continent,hovertemplate = "Continente: %{x}<br>Expectativa de Vida Promedio: %{y} años") %>%
  layout(title = "Expectativa de Vida Promedio por Continente",
         xaxis = list(title = "Continente"),
         yaxis = list(title = "Expectativa de Vida Promedio (años)"))

# Mostrar el gráfico interactivo
fig

#INTERPRETE LO QUE SE MUESTRA EN GRAFICO


# Calcular el promedio de expectativa de vida por continente y año
gapminder_avg <- gapminder %>%
  group_by(year, continent) %>%
  summarize(avg_lifeExp = mean(lifeExp), .groups = 'drop')

# Crear la gráfica interactiva
fig <- plot_ly(gapminder_avg, x = ~year, y = ~avg_lifeExp, color = ~continent) %>%
  layout(title = "Promedio de Expectativa de Vida por Continente anual",
         xaxis = list(title = "Año"),
         yaxis = list(title = "Expectativa de Vida"),
         hovermode = "closest") %>%
  add_markers(text = ~continent, hoverinfo = "text", selected = list(marker = list(size = 10)),
              click = ~paste("Continent:", continent, "<br>Average Life Expectancy:", avg_lifeExp)) %>%
  highlight(on = "plotly_click", off = "plotly_doubleclick",
            color = "rgba(0, 0, 0, 0)")

fig







plot_ly(gapminder, x = ~gdpPercap, y = ~lifeExp, color = ~year, type = 'scatter', mode = 'markers') %>%
  layout(title = "Relación entre el PIB per cápita y la expectativa de vida",
         xaxis = list(title = "PIB per cápita"),
         yaxis = list(title = "Expectativa de vida"),
         colorway = c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3", "#FF7F00", "#FFFF33", "#A65628", "#F781BF"),
         facet_row = ~year) %>%
  config(displayModeBar = TRUE)
#Esta gráfica de dispersión (scatter plot) interactiva, muestra la relación entre el PIB per cápita y la expectativa de vida. 
#Esta grafica se utilizo para observar si habia una relacion entre el PIB y la espectativa de vida al pasar los años.






fig <- plot_ly(gapminder, x = ~year, y = ~lifeExp, color = ~country, type = 'scatter', mode = 'lines') %>%
  layout(title = "Evolución de la expectativa de vida por país",
         xaxis = list(title = "Año"),
         yaxis = list(title = "Expectativa de vida"))

fig <- fig %>% layout(
  updatemenus = list(
    list(
      buttons = list(
        list(method = "restyle",
             args = list("visible", list(FALSE)),
             label = "Todos los países"),
        list(method = "restyle",
             args = list("visible", list(TRUE)),
             label = unique(gapminder$country))
      ),
      direction = "down",
      showactive = TRUE,
      active = 0,
      x = 0.1,
      xanchor = "left",
      y = 1.2,
      yanchor = "top"
    )
  )
)
fig
#Este gráfico interactivo de líneas, representa la evolución de la expectativa de vida para cada país a lo largo del tiempo. 
#Cada país se representa con una línea que muestra cómo ha variado su expectativa de vida a medida que transcurren los años.



head(gapminder)

gapminder_TenYears.scaled <- scale(x = gapminder_TenYears[,-c(1,2)], 
                                   center = TRUE, 
                                   scale = TRUE)
head(gapminder_TenYears.scaled)
#Se realiza un escalado de las variables del conjunto de datos “gapminder_TenYears” con el objetivo de estandarizar sus valores.
#Utilizamos solamente los años mas recientes para minimizar la cantidad de datos en procesamiento.



#REGLAS DE ASOCIACION
gapminder_TenYears.scaled <- scale(x = gapminder_TenYears$lifeExp, center = TRUE, scale = TRUE)
dist_gapminder_TenYears <- dist(gapminder_TenYears.scaled, method = "euclidean")
dist_mat <- as.matrix(round(dist_gapminder_TenYears, 3))
as.dist(dist_mat[1:6, 1:6])
#Se calcula la matriz de distancias entre las observaciones escaladas del conjunto de datos. 
#Esta matriz de distancias representa la medida de similitud o diferencia entre las observaciones en función de las variables escaladas.



#Metodo para encontrar numero optimo de clusters.
fviz_nbclust(gapminder_TenYears, FUN = hcut, method = "silhouette")
modelo <-hclust(dist_gapminder_TenYears, method ="complete")
fviz_dend(modelo, cex =0.1, k=2)

#Realizamos un analisis de agrupamiento con un engoque jerarquico para determinar el numero optimo de clusters basado en el metodo de silueta. 
#Se encontro que el numero optimo de clusters, usando este metodo fue 2. Se hizo un dendograma con el resultado del agrupamiento jerarquico.





