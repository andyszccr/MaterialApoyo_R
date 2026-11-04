# =====================================================================
# 06) GRÁFICO DE TORTA (pie) y DONUT
# =====================================================================
# El gráfico de pastel (pie) muestra PARTES DE UN TOTOO (proporciones).
# Uso: cuando quieres mostrar % de una sola variable categórica.
#
# Desventaja: es difícil comparar cantidades EXACTAS entre sectores,
# asi que para comparaciones, prefiere la BARRA.
#
# Parámetros de pie():
#   x       : frecuencias/porciones
#   labels  : etiquetas de cada sector
#   col     : color de cada sector
#   main    : título
#   radius  : <1 para hacer un "anillo" (donut)
#   clockwise : orientación de las porciones
# =====================================================================

# 1) Datos: tipos de clientes (conteo)
clientes <- c("Turista", "Estudiante", "Adulto", "Adulto mayor")
n <- c(120, 45, 80, 30)

# 2) Gráfico de pastel básico
pie(n, labels = clientes,
    col = c("gold", "lightgreen", "skyblue", "salmon"),
    main = "Tipos de clientes")

# 3) Añadir porcentajes como etiquetas
porcentajes <- round(n / sum(n) * 100, 1)
pie(n, labels = paste0(clientes, " (", porcentajes, "%)"),
    col = c("gold", "lightgreen", "skyblue", "salmon"),
    main = "Tipos de clientes (con %)")

# 4) Donut (anillo): radius = 0.8 hace un agujero en el centro
pie(n,
    labels = clientes,
    col = c("gold", "lightgreen", "skyblue", "salmon"),
    main = "Tipos de clientes (donut)",
    radius = 0.8)
