# =============================================================================
# Archivo: recursividad.R
# Descripcion: Ejemplo de recursividad y su equivalente con bucle en R
# Carpeta: 01_Introduccion_R/ejercicios_basicos
# =============================================================================

# =============================================================================
# QUE ES RECURSIVIDAD?
# =============================================================================
# La recursividad es una tecnica donde una funcion se llama a si misma
# para resolver un problema. Para evitar bucles infinitos, debe tener:
# 1. Un caso base (condicion de parada)
# 2. Un paso recursivo (la funcion se llama con un valor modificado)

# =============================================================================
# EJEMPLO 1: Funcion recursiva para calcular el factorial (según tu imagen)
# =============================================================================
# Recursion

fact <- function(x){
  if(x<=0){
    return(1)
  }else{
    return (x*fact(x-1))
  }
}

# Llamada a la funcion recursiva
fact(5)

# Resultado esperado en consola:
# [1] 120
# (porque 5! = 5 × 4 × 3 × 2 × 1 = 120)

# =============================================================================
# EJEMPLO 2: Equivalente usando un bucle (iterativo)
# =============================================================================
# El mismo calculo de factorial pero usando un bucle for en lugar de recursividad

fact_bucle <- function(x) {
  resultado <- 1
  for(i in 1:x) {
    resultado <- resultado * i
  }
  return(resultado)
}

# Llamada a la funcion con bucle
fact_bucle(5)

# Resultado esperado en consola:
# [1] 120
# (porque 5! = 5 × 4 × 3 × 2 × 1 = 120)

# =============================================================================
# COMPARACION: Recursividad vs Bucle
# =============================================================================
# Ambas funciones producen el mismo resultado para fact(5) = 120

# Recursividad:
# - La funcion se llama a si misma con x-1 hasta llegar a 0
# - Cada llamada se apila en la pila de ejecución (stack)
# - Puede causar desbordamiento de pila (stack overflow) con valores grandes

# Bucle:
# - Usa una variable acumuladora (resultado) que se actualiza en cada iteración
# - No crea llamadas adicionales a la función
# - Mas eficiente en memoria para valores grandes

# =============================================================================
# PRUEBAS ADICIONALES
# =============================================================================

# Probar con otros valores
print(fact(0))    # Resultado esperado: [1] 1 (caso base)
print(fact(1))    # Resultado esperado: [1] 1
print(fact(3))    # Resultado esperado: [1] 6 (3! = 6)
print(fact(6))    # Resultado esperado: [1] 720 (6! = 720)

# Comparar ambos metodos con el mismo valor
print(fact(4))        # [1] 24
print(fact_bucle(4))  # [1] 24