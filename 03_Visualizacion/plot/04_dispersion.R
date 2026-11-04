# =====================================================================
# 04) DIAGRAMA DE DISPERSIÓN (scatter plot)
# =====================================================================
# El gráfico de dispersión muestra la relación entre DOS variables
# numéricas: X (eje horizontal) vs Y (vertical).
# Sirve para detectar:
#   - tendencia (creciente/decreciente)
#   - correlación
#   - valores atípicos (outliers)
#
# Parámetros de plot():
#   pch : símbolo del punto (1-25, 19 = relleno, "+" o "o" también)
#   col : color
#   cex : tamaño del punto
#   xlab, ylab, main : etiquetas y título
#   xlim, ylim : rangos de los ejes
#
# abline(lm(...)) añade la recta de regresión lineal.
# cor(x, y) calcula el coeficiente de correlación de Pearson
# (entre -1 y 1).
# =====================================================================

# 1) Datos de ejemplo: estatura (X) vs peso (Y) de 15 personas
set.seed(7)
estatura <- round(rnorm(15, mean = 170, sd = 8), 1)
peso     <- round(estatura * 1.05 + rnorm(15, 0, 3), 1)

# 2) Gráfico de dispersión
plot(estatura, peso,
     pch = 19,            # 19 = punto relleno
     col = "darkred",
     cex = 1.5,           # tamaño del punto
     xlab = "Estatura (cm)",
     ylab = "Peso (kg)",
     main = "Relación entre estatura y peso",
     xlim = c(150, 190), ylim = c(50, 100))

# 3) Recta de regresión lineal (ajuste simple)
abline(lm(peso ~ estatura), col = "blue", lwd = 2)

# 4) Correlación de Pearson (entre -1 y 1)
cor(estatura, peso)

# 5) Interpretación
#    cor cercano a 1  -> relación positiva fuerte (cuanto más alta, más pesa)
#    cor cercano a -1 -> relación negativa fuerte
#    cor ~ 0          -> poca o ninguna relación lineal
#    Valores fuera de los patrones claros pueden ser OUTLIERS.
