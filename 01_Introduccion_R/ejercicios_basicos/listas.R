# =====================================================================
# LISTAS EN R
# ------------------------------------------------------------------------
# Una "lista" (list) es una estructura que puede guardar elementos de
# DISTINTO tipo y DISTINTA longitud en una sola variable.
# Se usa para agrupar resultados, configuraciones, registros, etc.
#
# Nota sobre los "vectores" en R:
#   - vector atomico  (c())  -> todos los elementos del MISMO tipo
#   - lista           (list()) -> cada elemento puede ser de tipo distinto
# =====================================================================

# 1) Crear una lista vacía ------------------------------------------------
mi_lista <- list()
print(mi_lista)
cat("Tamaño inicial de la lista vacía:", length(mi_lista), "\n")

# 2) Crear una lista con varios elementos ---------------------------------
persona <- list(
  nombre   = "Ana",
  edad     = 30,
  activa   = TRUE,
  email    = "ana@example.com"
)

print(persona)

# Mostrar la estructura de la lista
str(persona)

# 3) Una lista puede contener cualquier tipo de dato ---------------------
mi_lista <- list(
  numeros  = c(1, 2, 3, 4, 5),    # vector numérico
  texto    = "Hola, soy una lista", # texto
  booleano = FALSE,                # lógico
  vacío    = NULL,                 # valor vacío
  otro     = list(a = 1, b = 2)    # lista DENTRO de una lista
)

print(mi_lista)

# 4) Acceder a los elementos ---------------------------------------------
# Con el operador $ (por nombre) o [[]] (por nombre/posición)
persona$nombre
persona[["nombre"]]
persona[1]               # Mantiene la lista (sublista)
persona[["edad"]]        # Devuelve el valor, no la lista

# Acceder a un vector que está dentro de la lista
mi_lista$numeros
mi_lista$numeros[2]      # segundo elemento del vector "numeros"

# 5) Longitud y tamaño ----------------------------------------------------
length(mi_lista)         # número de elementos
length(persona)          # también sirve para listas

# 6) Modificar o añadir elementos -----------------------------------------
persona$edad <- 31                  # actualizar
persona$ciudad <- "Madrid"          # añadir nuevo campo
persona[c("nombre", "ciudad")]      # seleccionar varias

print(persona)

# 7) Listas anidadas ------------------------------------------------------
agenda <- list(
  semana = c("lunes", "martes", "miércoles"),
  tareas = list(
    lunes    = c("Estudiar R", "Hacer gimnasio"),
    martes   = "Leer un libro",
    miércoles = NULL
  ),
  metadatos = list(fecha_creacion = "2026-04-01", creado_por = "Ana")
)

print(agenda)

# Acceder a un valor anidado
agenda$tareas$martes
agenda$metadatos$fecha_creacion

# 8) Diferencia entre vector y lista --------------------------------------
# VECTOR atómico: elementos del MISMO tipo
vector <- c(1, 2, 3)
vector_texto <- c("a", "b", "c")

# LISTA: cada elemento puede ser de tipo distinto
lista_ejemplo <- list(1, "dos", TRUE, c(10, 20))

# Indexar un vector te devuelve el valor
vector[1]

# Indexar una lista con [[]] te devuelve el valor
lista_ejemplo[[1]]
lista_ejemplo[1]                   # sube una lista con ese elemento

# 9) Convertir una lista a vector (unlist) -------------------------------
numeros_en_lista <- list(1, 2, 3, 4, 5)
vector_de_numeros <- unlist(numeros_en_lista)

class(vector_de_numeros)
as.numeric(vector_de_numeros)

# 10) Convertir un vector en lista -----------------------------------------
vector <- c(10, 20, 30, 40)
vector_como_lista <- as.list(vector)

# 11) Funciones útiles ----------------------------------------------------
is.list(mi_lista)      # TRUE
is.vector(mi_lista)    # FALSE (una lista NO es un vector atómico)
names(mi_lista)        # nombres de los elementos

# 12) Iterar sobre una lista -----------------------------------------------
# lapply aplica una función a cada elemento y devuelve una lista
lapply(mi_lista$numeros, function(x) x * 2)

# sapply simplifica el resultado si es posible
sapply(mi_lista$numeros, function(x) x * 2)

# 13) Ejemplo práctico: guardar resultados de varias operaciones ----------
resultados <- list(
  media = mean(mi_lista$numeros),
  suma  = sum(mi_lista$numeros),
  longitud = length(mi_lista$numeros)
)

print(resultados)
