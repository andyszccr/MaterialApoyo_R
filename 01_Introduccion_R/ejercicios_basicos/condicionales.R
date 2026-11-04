# =============================================================================
# Archivo: condicionales.R
# Descripcion: Ejemplo de sentencias condicionales if/else en R
# Carpeta: 01_Introduccion_R/ejercicios_basicos
# =============================================================================

# Definicion de variables
a <- 150
b <- 225

# Condicional if simple
# Se ejecuta solo si la condición es verdadera
if (a > b) {
  print("a is greater than b")
}

# Nota: como a (150) no es mayor que b (225), el bloque if no se ejecuta
# y no se imprime nada en consola.

# =============================================================================
# Variante con if/else para cubrir ambos casos
# =============================================================================

if (a > b) {
  print("a es mayor que b")
} else {
  print("b es mayor o igual que a")
}

# Resultado esperado: "b es mayor o igual que a"

# =============================================================================
# Otro ejemplo con valores donde a > b
# =============================================================================

x <- 300
y <- 150

if (x > y) {
  print("x es mayor que y")
} else {
  print("y es mayor o igual que x")
}

# Resultado esperado: "x es mayor que y"