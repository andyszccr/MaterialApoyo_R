# =============================================================================
# Archivo: funciones.R
# Descripcion: Ejemplos de funciones en R
# Carpeta: 01_Introduccion_R/ejercicios_basicos
# =============================================================================

# Una funcion es un bloque de codigo que solo se ejecuta cuando se llama.

# Ejemplo 1: Funcion sin parametros
demo_function <- function() {
  print("Hello world")
}

# Llamada a la funcion
demo_function()

# Resultado esperado en consola:
# [1] "Hello world"

# =============================================================================
# Ejemplo 2: Funcion con parametros
# =============================================================================

demo_function <- function(fname, lname) {
  paste(fname, lname)
}

# Llamada a la funcion con argumentos
demo_function("Surendra", "Pericherla")

# Resultado esperado en consola:
# [1] "Surendra Pericherla"

# =============================================================================
# Ejemplo 3: Funcion con return values
# =============================================================================

find_square <- function(x) {
  return(x * x)
}

print(find_square(5))

# Resultado esperado en consola:
# [1] 25

find_cube <- function(x) {
  return(x * x * x)
}

print(find_square(7))

print(find_cube(10))

# Resultado esperado en consola:
# [1] 49
# [1] 1000