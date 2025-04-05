#Cargar y utilizar función IPAK
#ver vídeo https://www.youtube.com/watch?v=UjQz9SxG9rk

ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

packages <- c("tidyverse","cluster", "factoextra","NbClust","tidyr")
ipak(packages)

df <- USArrests
df

#normalizar las puntuaciones
#La escala es la normalización de un conjunto de datos utilizando el valor medio y la desviación estándar."
df <- scale(df)
head(df)

#calcular la matriz de distacias
m.distancia <- get_dist(df, method = "euclidean") #el método aceptado también puede ser: "maximum", "manhattan", "canberra", "binary", "minkowski", "pearson", "spearman" o "kendall"
fviz_dist(m.distancia, gradient = list(low = "blue", mid = "white", high = "red"))

#euclidean = El algoritmo de Euclides es un método para calcular el máximo común divisor (MCD) de dos números enteros. También se le conoce como "método de las divisiones sucesivas.



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

