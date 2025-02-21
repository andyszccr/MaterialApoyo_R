# Material de Apoyo de R
![image](https://github.com/user-attachments/assets/f5525d1e-9f31-4187-aec5-fb0df8226e44)



# Documentacion del proyecto
En este repositorio encontrarás todo lo relacionado a la documentación en R, tanto documentos, como material de apoyo, entre otros....

# Ventajas y desventajas Arboles de decision

Ventajas 

- Fáciles de entender e interpretar:
Los árboles de decisión son modelos visuales y intuitivos. Las reglas de decisión pueden representarse gráficamente, lo que los hace accesibles incluso para personas sin experiencia en machine learning.
- Manejan datos numéricos y categóricos:
Pueden trabajar con ambos tipos de datos sin necesidad de preprocesamiento extensivo (aunque algunos algoritmos como ID3 solo manejan categóricos).
- No requieren normalización o escalado de datos:
A diferencia de otros algoritmos (como SVM o KNN), los árboles de decisión no son sensibles a la escala de los datos.
- Automáticamente seleccionan características importantes:
Durante la construcción del árbol, se identifican las características más relevantes para la predicción, lo que ayuda a reducir la dimensionalidad.
- Robustos a valores faltantes:
Algunas implementaciones (como CART) pueden manejar datos incompletos o valores faltantes.

Eficientes computacionalmente:

Una vez entrenados, los árboles de decisión son rápidos para hacer predicciones, incluso con conjuntos de datos grandes.

Útiles para problemas de clasificación y regresión:

Algoritmos como CART pueden usarse tanto para predecir categorías como valores numéricos.

No asumen una distribución específica de los datos:

Los árboles de decisión no requieren que los datos sigan una distribución estadística particular (por ejemplo, normal).

Desventajas 

- Propensos al sobreajuste (overfitting):
Los árboles de decisión tienden a crear reglas muy específicas para los datos de entrenamiento, lo que puede resultar en un mal desempeño con datos nuevos. Esto es especialmente cierto si el árbol es muy profundo.
- Inestables ante pequeños cambios en los datos:
- Pequeñas variaciones en los datos de entrenamiento pueden generar árboles completamente diferentes, lo que afecta su generalización.
Sesgo hacia características con más niveles:
- Los algoritmos como CART tienden a favorecer características con más niveles o categorías, lo que puede no ser siempre deseable.
Dificultad para capturar relaciones complejas:
- Los árboles de decisión no son adecuados para modelar relaciones no lineales o interacciones complejas entre variables.
Limitaciones en la extrapolación:
No son buenos para hacer predicciones fuera del rango de los datos de entrenamiento, especialmente en problemas de regresión.
- Costoso en términos de memoria para árboles grandes:
Los árboles muy grandes pueden consumir mucha memoria y volverse difíciles de manejar.
- Dependencia de la métrica de división:
La elección de la métrica (por ejemplo, Gini, entropía) puede afectar el rendimiento del modelo.
- No son óptimos para datos desbalanceados:
Si una clase es mucho más frecuente que otra, el árbol puede sesgarse hacia la clase mayoritaria.

# Instalación de paquete llamado Tidyverse install.packages('titanic')
![image](https://github.com/user-attachments/assets/0961f8fc-9d99-4b97-bf63-c1a9ffd71393)

# Busqueda de dataset llamado Titanic_train
![image](https://github.com/user-attachments/assets/851927bc-69d4-4dd7-bc87-cac649bb889f)


# Tipos de arboles de decisión
Tipos de árboles de decisión
El algoritmo de Hunt, desarrollado en la década de 1960 para modelar el aprendizaje humano en Psicología, es la base de varios algoritmos de árboles de decisión populares, como los siguientes:

- ID3: a Ross Quinlan se le atribuye el desarrollo de ID3, que es la abreviatura de "Iterative Dichotomiser 3". Este algoritmo aprovecha la entropía y la ganancia de información como métricas para evaluar las divisiones de los candidatos. Algunas de las investigaciones de Quinlan sobre este algoritmo de 1986 se pueden encontrar aquí.

- C4.5: este algoritmo se considera una iteración posterior de ID3, que también fue desarrollado por Quinlan. Puede utilizar la ganancia de información o los ratios de ganancia para evaluar los puntos de división dentro de los árboles de decisión.

- CART: el término CART es una abreviatura de "árboles de clasificación y regresión" y fue introducido por Leo Breiman. Este algoritmo suele utilizar la impureza de Gini para identificar el atributo ideal para dividir. La impureza de Gini mide la frecuencia con la que se clasifica erróneamente un atributo elegido al azar. Al evaluar utilizando la impureza de Gini, un valor más bajo es más ideal.

# Documentos del proyectos 

- Presentación de arboles de decisión
[01 Arbol de desiciones.pptx](https://github.com/user-attachments/files/18901038/01.Arbol.de.desiciones.pptx)

- Arboles de desición con en R.
[03  Arbol de desición Titanic para usar.txt](https://github.com/user-attachments/files/18901059/03.Arbol.de.desicion.Titanic.para.usar.txt)

# Referencias 
- [Arboles de decisión IBM](https://www.ibm.com/mx-es/think/topics/decision-trees)
- [Arboles de decisión Conectasoftware](https://www.conectasoftware.com/magazine/arboles-de-decisiones-en-la-mineria-de-datos)
- [Ejercicio de R](https://www.youtube.com/watch?v=m1prEGQ-1As&t=1s)


