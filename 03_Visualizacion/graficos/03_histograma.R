# =====================================================================
# 03) HISTOGRAMA
# =====================================================================
# Un histograma es como un gráfico de barras de una variable
# NUMÉRICA CONTINUA, pero las barras (los "bins" o intervalos)
# representan rangos de valores, no categorías. Se usa para ver
# la DISTRIBUCIÓN (forma, centro y dispersión) de los datos.
#
# Nota: en un histograma la barra mide el GRAFICO DE FRECUENCIA
# (área = frecuencia relativa), no siempre la altura = conteo.
#
# Parámetros de hist():
#   x       : vector de datos numéricos
#   breaks  : número de intervalos (o una secuencia de límites)
#   col, border : color y borde de las barras
#   main, xlab, ylab : títulos y etiquetas
#   freq    : FALSE para dibujar densidad/probabilidad en vez de conteo
# =====================================================================

# 1) Generar datos numéricos (simulación de alturas de 1000 personas)
set.seed(42)                               # fija la semilla para repetir resultados
alturas <- rnorm(1000, mean = 165, sd = 8) # 1000 valores ~ N(165, 8^2)

# 2) Histograma básico
hist(alturas,
     breaks = 15,              # número de intervalos
     col = "steelblue",
     border = "white",
     main = "Distribución de alturas",
     xlab = "Altura (cm)",
     ylab = "Frecuencia")

# 3) Explicar los parámetros clave
# breaks: si pones un número, R elige el ancho; si pones una secuencia,
#         usará esos límites exactos.
# freq = FALSE: muestra la DENSIDAD (área total = 1), útil para comparar
#              con curvas teóricas (como la normal)

hist(alturas,
     breaks = 15,
     freq = FALSE,
     col = "orange",
     main = "Histograma de densidad (área = 1)",
     xlab = "Altura (cm)")

# 4) Sobre el histograma, añadir la curva normal teórica
#     para ver si los datos se acercan a una distribución normal
x <- seq(min(alturas), max(alturas), length = 100)
y <- dnorm(x, mean = mean(alturas), sd = sd(alturas))
lines(x, y, col = "red", lwd = 2)   # lines() sobre el histograma existente

# 5) Conocer un poco la distribución de los datos
mean(alturas)            # media
sd(alturas)              # desviación típica
summary(alturas)         # min, 1er Q, mediana, media, 3er Q, max
