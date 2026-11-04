# =============================================================================
# Archivo: condicionales.R
# Descripcion: Ejemplo de sentencias condicionales if/else en R
# Carpeta: 01_Introduccion_R/ejercicios_basicos
# =============================================================================

# Definicion de variables
a <- 150
b <- 225

# Condicional if/else
# Si a es mayor que b, imprime "a is greater than b"
# De lo contrario, imprime "b is greater than a"
if (a > b) {
  print("a is greater than b")
} else {
  print("b is greater than a")
}

# Resultado esperado: "b is greater than a"
# (porque 150 no es mayor que 225)

# =============================================================================
# Otro ejemplo con valores donde la primera condicion se cumple
# =============================================================================

x <- 300
y <- 150

if (x > y) {
  print("x is greater than y")
} else {
  print("y is greater than x")
}

# Resultado esperado: "x is greater than y"