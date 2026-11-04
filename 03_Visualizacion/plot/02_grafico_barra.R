# =====================================================================
# 02) GRÁFICO DE BARRAS
# =====================================================================
# El gráfico de barras compara CATÉGORÍAS (valores discretos).
# En R se hace con barplot(); es preferible a plot(factor) por
# control total sobre etiquetas, colores y apilamiento.
#
# Parámetros de barplot():
#   height      : vectores de frecuencias (o matriz para apilar/grupos)
#   names.arg   : etiquetas debajo de cada barra
#   col         : color de las barras
#   border      : color del borde
#   main, xlab, ylab : títulos y etiquetas
#   ylim        : rango del eje y (después del 0, para espacio)
#   horiz       : TRUE para barras horizontales
#   beside      : FALSE = apiladas; TRUE = juntas (grupos)
# =====================================================================

# 1) Datos de ejemplo: ventas de 5 días
dias  <- c("Lun", "Mar", "Mié", "Jue", "Vie")
ventas <- c(140, 98, 121, 201, 213)
ventas2 <- c(90, 130, 160, 110, 140)   # segundo grupo (producto B)

# 2) Barras verticales por defecto
barplot(ventas,
        names.arg = dias,
        col = "steelblue",
        main = "Ventas por día (barras verticales)",
        xlab = "Día", ylab = "Ventas (unidades)",
        ylim = c(0, max(ventas) * 1.15),
        border = "white")

# 3) Barras horizontales (muy útil con muchos nombres largos)
barplot(ventas,
        names.arg = dias,
        col = "darkgreen",
        main = "Ventas por día (barras horizontales)",
        xlab = "Ventas (unidades)",
        horiz = TRUE)

# 4) Barras apiladas: height puede ser una MATRIZ (2 grupos)
mat <- matrix(c(100, 120, 150, 130, 160,
                80, 90, 110, 100, 115),
              nrow = 5, byrow = TRUE,
              dimnames = list(paste("Sem", 1:5), c("A", "B")))

barplot(mat,
        col = c("lightblue", "salmon"),
        main = "Ventas anteriores (apiladas)",
        ylab = "Ventas (unidades)")
legend("topright", legend = c("A", "B"), fill = c("lightblue", "salmon"))

# 5) Barras juntas (side by side)
barplot(rbind(ventas, ventas2),   # dos filas -> dos grupos de barras
        names.arg = dias,
        col = c("skyblue", "salmon"),
        main = "Comparación: Producto A vs B",
        ylab = "Ventas (unidades)",
        beside = TRUE)

# 6) Añadir los valores encima de las barras (pos = 3 -> encima)
barx <- barplot(ventas, col = "white")   # guarda las coordenadas x
text(x = barx, y = ventas, labels = ventas, pos = 3, col = "black")
