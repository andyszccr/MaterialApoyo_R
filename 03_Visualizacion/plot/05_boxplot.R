# =====================================================================
# 05) BOXPLOT (diagrama de caja y bigotes)
# =====================================================================
# El boxplot resume una DISTRIBUCIÓN con:
#   - caja: del 1er cuartil (Q1) al 3er cuartil (Q3)
#   - línea en el centro: MEDIANA
#   - bigotes: rango hasta 1.5 * IQR (valores atípicos fuera)
#
# Sirve para COMPARAR varios grupos y detectar outliers de forma
# rápida, sin necesidad de dibujar todos los puntos.
#
# Parámetros:
#   formula  : y ~ grupo  (o vector numérico + vector de grupos)
#   data     : data.frame con los datos
#   col, border : color de la caja y borde
#   main, xlab, ylab
#   horizontal = TRUE  : horizontal
#   outline    = FALSE : oculta los outliers
# =====================================================================

# 1) Datos de ejemplo: notas de dos clases
notas_claseA <- c(7, 8, 6, 9, 7.5, 8, 6.5, 7, 5.5, 8.5)
notas_claseB <- c(4, 5, 6, 4.5, 3, 5.5, 7, 3.5, 4, 6.5)

# 2) Data frame para usar la fórmula y ~ grupo
notas <- data.frame(
  nota = c(notas_claseA, notas_claseB),
  clase = factor(rep(c("A", "B"), each = 10))
)

# 3) Boxplot de dos grupos
boxplot(nota ~ clase,
        data = notas,
        col = c("lightblue", "salmon"),
        main = "Notas por clase",
        ylab = "Nota",
        horizontal = FALSE)

# Leyenda de los grupos
legend("bottomright",
       legend = levels(notas$clase),      # "A", "B"
       fill = c("lightblue", "salmon"))

# 4) Boxplot de un solo grupo
boxplot(notas_claseA, col = "lightgreen",
        main = "Clase A", ylab = "Nota", horizontal = TRUE)

# 5) Detectar outliers
#    Los puntos fuera de los bigotes se marcan como outliers.
#    boxplot(..., outline = FALSE) los oculta.
