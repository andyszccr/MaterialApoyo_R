# ==============================================================================
# SCRIPT: Análisis de Clustering con K-means
# AUTOR: Material de Apoyo R
# FECHA: 2025
# DESCRIPCIÓN: Este script implementa análisis de clustering usando el algoritmo
#              K-means con el dataset USArrests. Incluye normalización de datos,
#              estimación del número óptimo de clusters y visualización de resultados.
# REFERENCIA: https://www.youtube.com/watch?v=UjQz9SxG9rk
# ==============================================================================

# ==============================================================================
# SECCIÓN 1: CONFIGURACIÓN Y CARGA DE LIBRERÍAS
# ==============================================================================

# Función personalizada para instalar y cargar paquetes automáticamente
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# Lista de paquetes necesarios para el análisis
packages <- c("tidyverse", "cluster", "factoextra", "NbClust", "tidyr")
ipak(packages)

# ==============================================================================
# SECCIÓN 2: CARGA Y PREPARACIÓN DE DATOS
# ==============================================================================

# Cargar el dataset USArrests (datos de arrestos por estado en USA)
df <- USArrests
df

# Normalizar los datos usando escala estandarizada (z-score)
# La escala estandariza los datos usando la media y desviación estándar
# Fórmula: (x - media) / desviación_estándar
df <- scale(df)
head(df)

# ==============================================================================
# SECCIÓN 3: ANÁLISIS DE DISTANCIAS
# ==============================================================================

# Calcular la matriz de distancias usando distancia euclidiana
# Métodos disponibles: "maximum", "manhattan", "canberra", "binary", 
# "minkowski", "pearson", "spearman", "kendall"
m.distancia <- get_dist(df, method = "euclidean")

# Visualizar la matriz de distancias
# Colores: azul (baja distancia), blanco (media), rojo (alta distancia)
fviz_dist(m.distancia, gradient = list(low = "blue", mid = "white", high = "red"))

# NOTA: La distancia euclidiana es la distancia en línea recta entre dos puntos
# en un espacio multidimensional



#estimar el número de clústers
#Elbow, silhouette o gap_stat  method
fviz_nbclust(df, kmeans, method = "wss")
fviz_nbclust(df, kmeans, method = "silhouette")
fviz_nbclust(df, kmeans, method = "gap_stat")

#con esta función se pueden calcular:
#the index to be calculated. This should be one of : "kl", "ch", "hartigan", "ccc", "scott",
#"marriot", "trcovw", "tracew", "friedman", "rubin", "cindex", "db", "silhouette", "duda",
#"pseudot2", "beale", "ratkowsky", "ball", "ptbiserial", "gap", "frey", "mcclain", "gamma",
#"gplus", "tau", "dunn", "hubert", "sdindex", "dindex", "sdbw", "all" (all indices except GAP,
#Gamma, Gplus and Tau), "alllong" (all indices with Gap, Gamma, Gplus and Tau included).
resnumclust<-NbClust(df, distance = "euclidean", min.nc=2,
                     max.nc=10, method = "kmeans", index = "alllong")
fviz_nbclust(resnumclust)

#calculamos los dos clústers
k2 <- kmeans(df, centers = 2, nstart = 25)
k2
str(k2)

#plotear los cluster
fviz_cluster(k2, data = df)
fviz_cluster(k2, data = df,
             ellipse.type = "euclid",repel = TRUE,
             star.plot = TRUE) #ellipse.type= "t", "norm", "euclid"
fviz_cluster(k2, data = df, ellipse.type = "norm")
fviz_cluster(k2, data = df, ellipse.type = "norm",
             palette = "Set2", ggtheme = theme_minimal())

res2 <- hcut(df, k = 2, stand = TRUE)
fviz_dend(res2, rect = TRUE, cex = 0.5,
          k_colors = c("red","#2E9FDF"))

res4 <- hcut(df, k = 4, stand = TRUE)
fviz_dend(res4, rect = TRUE, cex = 0.5,
          k_colors = c("red","#2E9FDF","green","black"))

