# =====================================================================
# 02) GRÁFICO DE BARRAS
# =====================================================================
# El gráfico de barras compara CATÉGORÍAS (valores discretos).
# Existen dos formas de hacerlo en R:
#   A) barplot(height)  : requiere un vector numérico de frecuencias
#   B) plot(factor)    : aproxima barras, pero barplot() es lo recomendado
#
# Parámetros de barplot():
#   height      : vectores de frecuencias (o una matriz para barras apiladas/grupadas)
#   names.arg   : etiquetas debajo de cada barra
#   col         : color de las barras
#   main, xlab, ylab : títulos y etiquetas
#   horiz       : TRUE para barras horizontales
# =====================================================================

# 1) Ejemplo: ventas de 5 días
dias  <- c("Lun", "Mar", "Mié", "Jue", "Vie")
ventas <- c(140, 98, 121, 201, 213)

# 2) Barras verticales por defecto
barplot(ventas,
        names.arg = dias,      # etiquetas debajo de cada barra
        col = "steelblue",
        main = "Ventas por día (barras verticales)",
        xlab = "Día", ylab = "Ventas (unidades)",
        ylim = c(0, max(ventas) * 1.15),   # un poco de espacio superior
        border = "white")                  # borde de las barras

# 3) Barras horizontales (útil cuando hay muchas categorías con nombres largos)
barplot(ventas,
        names.arg = dias,
        col = "darkgreen",
        main = "Ventas por día (barras horizontales)",
        xlab = "Ventas (unidades)",
        horiz = TRUE)     # <-- horizontal

# 4) Barras apiladas: height puede ser una MATRIZ
# (una matriz de 2 columnas = 2 grupos a comparar)
grupo <- c("A", "B")
semanas <- 1:5
ventas_grupo <- matrix(c(100, 120, 150, 130, 160,
                         80, 90, 110, 100, 115),
                       nrow = 5, byrow = TRUE,
                       dimnames = list(paste("Sem", semanaas), grupo))

# Otra forma más simple con dos vectores independientes:
barplot(rbind(ventas, ventas2),   # rbind junta vectores en filas
        names.arg = dias,
        col = c("skyblue", "salmon"),
        main = "Ventas de dos productos",
        ylab = "Ventas (unidades)",
        beside = TRUE)   # TRUE = barras juntas; FALSE = apiladas

# 5) Etiqueta de los valores encima de las barras (ajuste manual)
barplot(ventas,
        names.arg = dias,
        col = "orange",
        main = "Ventas (con etiquetas)",
        ylab = "Ventas (unidades)")
text(x = barplot(ventas, col = "white"),   # devuelve las posiciones x de las barras
     y = ventas, labels = ventas, pos = 3)   # pos=3 = encima
