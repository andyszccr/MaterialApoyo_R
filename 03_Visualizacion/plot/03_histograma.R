# =====================================================================
# 03) HISTOGRAMA
# =====================================================================
# Un histograma es como un gráfico de barras de una variable
# NUMÉRICA CONTINUA, pero las barras (los "bins" o intervalos)
# representan RANGOS de valores, no categorías.
#
# Uso: ver la DISTRIBUCIÓN de los datos (forma, centro y dispersión).
# Cada barra mide la DENSIDAD de los valores que caen en ese intervalo.
#
# Parámetros de hist():
#   x       : vector numérico
#   breaks  : número de intervalos (o secuencia de límites)
#   col, border : color y borde
#   main, xlab, ylab : títulos
#   freq    : FALSE para densidad (área total = 1)
#   probability : igual que freq = FALSE (alias)
# =====================================================================

# 1) Simular datos: alturas de 1000 personas (distribución casi normal)
set.seed(42)                                # semilla fija -> resultados repetibles
alturas <- rnorm(1000, mean = 165, sd = 8)  # N(165, 8^2)

# 2) Histograma básico
hist(alturas,
     breaks = 15,              # número de intervalos del eje X
     col = "steelblue",
     border = "white",
     main = "Distribución de alturas",
     xlab = "Altura (cm)",
     ylab = "Frecuencia")

# 3) Densidad (área total = 1): útil para comparar con una curva
hist(alturas,
     breaks = 15,
     freq = FALSE,              # <-- probabilidad/densidad en vez de conteo
     col = "orange",
     main = "Histograma de densidad",
     xlab = "Altura (cm)")

# 4) Añadir la curva normal teórica para comparar
#    dnorm(x) = densidad de N(x; media, sd)
x <- seq(min(alturas), max(alturas), length = 100)
y <- dnorm(x, mean = mean(alturas), sd = sd(alturas))
lines(x, y, col = "red", lwd = 2)
# Este gráfico ayuda a ver si los datos siguen una distribución normal.

# 5) Resumen numérico de la distribución
mean(alturas)      # media
sd(alturas)        # desviación típica
summary(alturas)   # min, 1er Q, mediana, media, 3er Q, máximo
