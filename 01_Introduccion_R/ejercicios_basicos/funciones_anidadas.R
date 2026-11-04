# =============================================================================
# Archivo: funciones_anidadas.R
# Descripcion: Explicacion y ejemplos de funciones anidadas (nested functions) en R
# Carpeta: 01_Introduccion_R/ejercicios_basicos
# =============================================================================

# =============================================================================
# QUE ES UNA FUNCION ANIDADA?
# =============================================================================
# Una funcion anidada es una funcion definida dentro del cuerpo de otra funcion.
# La funcion interna (anidada) solo puede ser accedida desde dentro de la
# funcion externa. Tiene acceso a las variables de la funcion externa (closure).
#
# Caracteristicas:
# - La funcion interna se define dentro de la funcion externa
# - La funcion interna puede acceder a los parametros y variables de la externa
# - La funcion externa puede retornar la funcion interna como resultado
# - La funcion interna NO se puede llamar directamente desde fuera de la externa

# =============================================================================
# EJEMPLO 1: Funcion anidada basica (según tu imagen)
# =============================================================================
# Nested Functions in R

outer_function <- function(x){
  inner_function <- function(y){
    z <- x + y
    return(z)
  }
  return(inner_function)
}

# Como usarla:
# Paso 1: Llamar a la funcion externa con un valor para x
# Esto retorna la funcion interna (con x "capturado")

mi_funcion <- outer_function(10)  # x = 10

# Paso 2: Usar la función retornada con un valor para y
resultado <- mi_funcion(5)        # y = 5, z = 10 + 5 = 15

print(resultado)  # Resultado esperado: [1] 15

# =============================================================================
# EJEMPLO 2: Calculadora con funciones anidadas
# =============================================================================
# Creamos una funcion externa que retorna diferentes operaciones
# segun el tipo de operacion solicitada

calculadora <- function(operacion) {
  sumar <- function(a, b) {
    return(a + b)
  }
  
  restar <- function(a, b) {
    return(a - b)
  }
  
  multiplicar <- function(a, b) {
    return(a * b)
  }
  
  dividir <- function(a, b) {
    if (b == 0) {
      return("Error: division por cero")
    }
    return(a / b)
  }
  
  # Retornamos la funcion correspondiente según la operación
  if (operacion == "suma") {
    return(sumar)
  } else if (operacion == "resta") {
    return(restar)
  } else if (operacion == "multiplicacion") {
    return(multiplicar)
  } else if (operacion == "division") {
    return(dividir)
  } else {
    return("Operacion no valida")
  }
}

# Como usarla:
sumar_fn <- calculadora("suma")
resultado_suma <- sumar_fn(8, 3)
print(resultado_suma)  # Resultado esperado: [1] 11

multiplicar_fn <- calculadora("multiplicacion")
resultado_mult <- multiplicar_fn(4, 7)
print(resultado_mult)  # Resultado esperado: [1] 28

# =============================================================================
# EJEMPLO 3: Contador con estado (closure)
# =============================================================================
# Una funcion anidada puede "recordar" el estado entre llamadas

contador <- function() {
  count <- 0  # variable que se mantiene entre llamadas
  
  incrementar <- function() {
    count <<- count + 1  # <<- modifica la variable del entorno padre
    return(count)
  }
  
  reiniciar <- function() {
    count <<- 0
    return(0)
  }
  
  # Retornamos ambas funciones como una lista
  return(list(incrementar = incrementar, reiniciar = reiniciar))
}

# Como usarla:
mi_contador <- contador()

print(mi_contador$incrementar())  # Resultado esperado: [1] 1
print(mi_contador$incrementar())  # Resultado esperado: [1] 2
print(mi_contador$incrementar())  # Resultado esperado: [1] 3

print(mi_contador$reiniciar())    # Resultado esperado: [1] 0
print(mi_contador$incrementar())  # Resultado esperado: [1] 1

# =============================================================================
# RESUMEN
# =============================================================================
# - Una funcion anidada se define dentro de otra funcion
# - Puede acceder a las variables de la funcion externa (closure)
# - La funcion externa puede retornar la funcion interna
# - Es util para crear factories de funciones, manteners estado y encapsular logica
# - La funcion interna no es accesible directamente desde fuera de la externa