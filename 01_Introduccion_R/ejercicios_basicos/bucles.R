# =============================================================================
# Archivo: bucles.R
# Descripcion: Ejemplo de bucle while en R
# Carpeta: 01_Introduccion_R/ejercicios_basicos
# =============================================================================

# while Loop
# Initialize Loop Variable
i <- 1

# Conditional Expression
while(i <= 10) {
  print(i)

  # Update statement
  i <- i + 3
}

# Resultado esperado en consola:
# [1] 1
# [1] 4
# [1] 7
# [1] 10

# =============================================================================
# Ejemplo con break statement
# =============================================================================

# while Loop
# Initialize Loop Variable
i <- 100

# Conditional Expression
while(i >= 1) {
  print(i)

  # Update statement
  i <- i - 1

  # Break statement: detiene el bucle cuando i llega a 85
  if(i == 85) {
    break
  }
}

# Resultado esperado en consola:
# [1] 100
# [1] 99
# ...
# [1] 86
# [1] 85
# (el bucle se detiene en 85 gracias al break)