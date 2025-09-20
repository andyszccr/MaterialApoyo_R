# 📋 Templates de R Markdown

Esta carpeta contiene plantillas predefinidas de R Markdown para diferentes tipos de análisis y reportes.

## 📄 Templates Disponibles

### 📊 **Template de Análisis Completo**
- **Archivo:** `template_analisis_completo.Rmd`
- **Propósito:** Análisis exhaustivo de datasets
- **Características:**
  - Estructura completa de EDA
  - Estadísticas descriptivas
  - Visualizaciones múltiples
  - Análisis de correlaciones
  - Conclusiones y recomendaciones
- **Uso:** Para análisis detallados de datos

### 📈 **Template de Dashboard**
- **Archivo:** `template_dashboard.Rmd`
- **Propósito:** Crear dashboards interactivos
- **Características:**
  - Múltiples páginas
  - Métricas principales
  - Gráficos interactivos
  - Tablas de datos
  - Controles dinámicos
- **Uso:** Para presentar datos de forma visual e interactiva

### 🎯 **Template de Presentación**
- **Archivo:** `template_presentacion.Rmd`
- **Propósito:** Crear presentaciones profesionales
- **Características:**
  - Formato de diapositivas
  - Estructura narrativa
  - Visualizaciones optimizadas
  - Conclusiones ejecutivas
- **Uso:** Para presentar resultados a audiencias

## 🚀 Cómo Usar los Templates

### 1. **Copiar el Template**
```bash
# Copiar template a tu proyecto
cp templates/template_analisis_completo.Rmd mi_analisis.Rmd
```

### 2. **Personalizar el Contenido**
- Reemplazar `[nombre_dataset]` con el nombre real del archivo
- Ajustar `[Tu Nombre]` con tu información
- Modificar las secciones según tus necesidades
- Personalizar los gráficos y análisis

### 3. **Renderizar el Documento**
```r
# En RStudio
rmarkdown::render("mi_analisis.Rmd")

# O usar el botón "Knit" en RStudio
```

## 🎨 Personalización

### Colores y Temas
```yaml
# En el YAML header
output: 
  html_document:
    theme: flatly  # Cambiar por: cerulean, cosmo, darkly, etc.
    highlight: tango  # Cambiar por: default, zenburn, etc.
```

### Configuración de Gráficos
```r
# En el chunk setup
knitr::opts_chunk$set(
  fig.width = 10,    # Ancho de gráficos
  fig.height = 6,    # Alto de gráficos
  fig.align = "center"  # Alineación
)
```

### Estilos CSS Personalizados
```css
/* Crear archivo custom.css */
h1 { color: #2c3e50; }
h2 { color: #34495e; }
.title { font-size: 24px; }
```

## 📋 Checklist de Personalización

### ✅ **Información Básica**
- [ ] Título del documento
- [ ] Nombre del autor
- [ ] Fecha de creación
- [ ] Objetivo del análisis

### ✅ **Datos**
- [ ] Ruta correcta al dataset
- [ ] Variables relevantes identificadas
- [ ] Filtros necesarios aplicados

### ✅ **Análisis**
- [ ] Estadísticas descriptivas apropiadas
- [ ] Visualizaciones relevantes
- [ ] Interpretaciones correctas
- [ ] Conclusiones válidas

### ✅ **Presentación**
- [ ] Formato consistente
- [ ] Colores apropiados
- [ ] Tamaños de gráficos optimizados
- [ ] Texto claro y conciso

## 🔧 Funciones Útiles para Templates

### Cargar Datos
```r
# Función para cargar datos con validación
cargar_datos <- function(ruta) {
  if (!file.exists(ruta)) {
    stop("El archivo no existe: ", ruta)
  }
  
  datos <- read.csv(ruta)
  cat("Datos cargados:", nrow(datos), "filas x", ncol(datos), "columnas\n")
  return(datos)
}
```

### Crear Gráficos Estándar
```r
# Función para histogramas estándar
histograma_estandar <- function(datos, variable, titulo = NULL) {
  if (is.null(titulo)) titulo <- paste("Distribución de", variable)
  
  ggplot(datos, aes_string(x = variable)) +
    geom_histogram(bins = 30, fill = "steelblue", alpha = 0.7) +
    labs(title = titulo, x = variable, y = "Frecuencia") +
    theme_minimal()
}
```

## 📚 Recursos Adicionales

### Documentación R Markdown
- [R Markdown: The Definitive Guide](https://bookdown.org/yihui/rmarkdown/)
- [R Markdown Cookbook](https://bookdown.org/yihui/rmarkdown-cookbook/)

### Templates Avanzados
- [R Markdown Gallery](https://rmarkdown.rstudio.com/gallery.html)
- [Flexdashboard Examples](https://rmarkdown.rstudio.com/flexdashboard/)

### Estilos y Temas
- [Bootswatch Themes](https://bootswatch.com/)
- [CSS Customization Guide](https://bookdown.org/yihui/rmarkdown-cookbook/html-css.html)

## 🆘 Solución de Problemas

### Error: "Package not found"
```r
# Instalar paquetes faltantes
install.packages(c("tidyverse", "ggplot2", "plotly", "DT"))
```

### Error: "File not found"
```bash
# Verificar rutas de archivos
ls -la datasets/
```

### Error: "Chunk failed"
```r
# Verificar código en chunks
# Usar echo = TRUE para debug
knitr::opts_chunk$set(echo = TRUE)
```

---

**💡 Tip:** Siempre prueba los templates con datos de ejemplo antes de usar con datos reales importantes.
