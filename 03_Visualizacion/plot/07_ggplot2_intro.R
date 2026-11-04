# =====================================================================
# 07) INTRODUCCIÓN A GGPLOT2
# =====================================================================
# ggplot2 sigue la "Gramática de los Gráficos":
# cada gráfico se arma de CAPAS:
#   data     : los datos (data.frame)
#   aes()    : qué variable va en X, Y, color, tamaño, relleno...
#   geom_*   : la capa de dibujo (puntos, línea, barras, caja...)
#   labs()   : título y etiquetas de ejes y leyenda
#   theme()  : estilo y disposición
#
# + geom_*() apila capas. theme_minimal() es un estilo base limpio.
#
# Para usarlo:
#   install.packages("ggplot2")
#   library(ggplot2)
# =====================================================================

# 1) Datos de ejemplo: 30 estudiantes (tiempo de estudio vs nota)
set.seed(3)
estudio <- data.frame(
  estudiando = sample(1:10, 30, replace = TRUE),
  nota       = sample(4:10, 30, replace = TRUE),
  sexo       = sample(c("M","F"), 30, replace = TRUE)
)

# 2) Gráfico de puntos (geom_point) - la capa básica
ggplot(estudio, aes(x = estudiando, y = nota, color = sexo)) +
  geom_point(size = 3) +
  labs(title = "Nota vs tiempo de estudio",
       x = "Horas de estudio", y = "Nota obtenida") +
  theme_minimal()

# 3) Añadir la línea de tendencia (geomsmooth)
ggplot(estudio, aes(x = estudiando, y = nota, color = sexo)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +   # "lm" = regresión lineal
  labs(title = "Nota vs tiempo de estudio (con tendencia)",
       x = "Horas de estudio", y = "Nota obtenida") +
  theme_minimal()

# 4) Barras: contar frecuencia de una categoría (count)
ggplot(estudio, aes(x = sexo)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Nº de estudiantes por sexo",
       x = "Sexo", y = "Frecuencia") +
  theme_minimal()

# 5) Histograma con ggplot2
ggplot(estudio, aes(x = nota)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "white") +
  labs(title = "Distribución de notas",
       x = "Nota", y = "Frecuencia") +
  theme_minimal()
