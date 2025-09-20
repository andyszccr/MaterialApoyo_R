# ==============================================================================
# EJERCICIO 1: Fundamentos Básicos de R
# NIVEL: Principiante
# TIEMPO ESTIMADO: 30 minutos
# ==============================================================================

# ==============================================================================
# OBJETIVO
# ==============================================================================
# Aprender las operaciones básicas de R: variables, vectores y funciones
# matemáticas fundamentales.

# ==============================================================================
# INSTRUCCIONES
# ==============================================================================
# 1. Ejecuta cada línea de código paso a paso
# 2. Observa los resultados en la consola
# 3. Modifica los valores y experimenta
# 4. Responde las preguntas al final

# ==============================================================================
# PARTE 1: OPERACIONES BÁSICAS
# ==============================================================================

# Ejecuta estas operaciones y observa los resultados
5 + 3
10 - 4
6 * 7
15 / 3
2^3
17 %% 5

# ==============================================================================
# PARTE 2: VARIABLES
# ==============================================================================

# Asigna valores a variables
edad <- 25
nombre <- "María"
altura <- 1.65

# Muestra las variables
edad
nombre
altura

# Realiza operaciones con variables
edad_en_10_anos <- edad + 10
edad_en_10_anos

# ==============================================================================
# PARTE 3: VECTORES BÁSICOS
# ==============================================================================

# Crea vectores numéricos
numeros <- c(1, 2, 3, 4, 5)
numeros

# Crea vectores de texto
colores <- c("rojo", "verde", "azul")
colores

# Crea vectores con secuencias
uno_a_diez <- 1:10
uno_a_diez

# ==============================================================================
# PARTE 4: OPERACIONES CON VECTORES
# ==============================================================================

# Suma elementos de un vector
sum(numeros)

# Calcula la media
mean(numeros)

# Encuentra el máximo y mínimo
max(numeros)
min(numeros)

# ==============================================================================
# PARTE 5: FUNCIONES ÚTILES
# ==============================================================================

# Longitud de un vector
length(numeros)

# Tipo de datos
class(numeros)
class(colores)

# ==============================================================================
# EJERCICIOS PARA PRACTICAR
# ==============================================================================

# EJERCICIO 1: Crea un vector con las edades de 5 personas
# [TU CÓDIGO AQUÍ]

# EJERCICIO 2: Calcula la edad promedio
# [TU CÓDIGO AQUÍ]

# EJERCICIO 3: Crea un vector con nombres de ciudades
# [TU CÓDIGO AQUÍ]

# EJERCICIO 4: Calcula cuántas ciudades hay en tu vector
# [TU CÓDIGO AQUÍ]

# ==============================================================================
# PREGUNTAS DE REFLEXIÓN
# ==============================================================================
# 1. ¿Qué diferencia hay entre <- y = para asignar variables?
# 2. ¿Qué pasa si intentas sumar un vector numérico y uno de texto?
# 3. ¿Cómo puedes acceder al tercer elemento de un vector?
# 4. ¿Qué función usarías para encontrar el valor más grande en un vector?
