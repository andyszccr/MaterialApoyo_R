# =====================================================================
# 01) GRÁFICO DE LÍNEAS (type = "l")
# =====================================================================
# El gráfico de líneas conecta los puntos con líneas.
# Se usa sobre todo para variables en el TIEMPO (series temporales),
# porque revela la tendencia y el ritmo de cambio.
#
# Parámetros clave de plot():
#   type = "l"  : solo líneas
#                "p" : solo puntos
#                "b" : ambos
#                "o" : sobreimpreso (líneas con los puntos)
#   col      : color de la línea
#   lwd      : grosor de la línea
#   lty      : estilo de la línea (1 sólida, 2 discontinua, ...)
#   main     : título
#   xlab, ylab : etiquetas de los ejes
#   xlim, ylim : rangos de los ejes (útil para añadir más líneas)
# =====================================================================

# 1) Datos de ejemplo: ventas de 5 días consecutivos
dias   <- c("Lun", "Mar", "Mié", "Jue", "Vie")
ventas <- c(120, 180, 210, 160, 230)

# 2) Gráfico básico de líneas
plot(dias, ventas,
     type = "l",   # solo líneas
     col  = "blue",
     lwd  = 2,
     main = "Ventas semanales",
     xlab = "Día de la semana",
     ylab = "Ventas (unidades)")

# 3) Agregar los puntos sobre la línea (para no "perder" los datos)
points(dias, ventas, pch = 19, col = "red")   # pch = símbolo del punto

# 4) Múltiples líneas en un mismo gráfico
semanas <- 1:5
ventas2 <- c(100, 150, 170, 140, 190)

# ylim = "eje y" fijo para que las dos líneas entren todas
plot(semanas, ventas,
     type = "l", col = "blue", lwd = 2,
     ylim = c(0, 250),
     main = "Comparación de dos series",
     xlab = "Semana", ylab = "Ventas (unidades)")

# lines() añade una línea al gráfico ya abierto (no crea uno nuevo)
lines(semanas, ventas2, col = "red", lwd = 2, lty = 2)   # lty=2: discontinuo

# 5) Leyenda de qué serie es cada una
legend("topleft", legend = c("Ventas A", "Ventas B"),
       col = c("blue", "red"), lwd = 2, lty = c(1, 2))
