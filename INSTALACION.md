# 🔧 Guía de Instalación - MaterialApoyo_R

Esta guía te ayudará a configurar R y RStudio en tu sistema para usar el material de apoyo.

## 🖥️ **Instalación por Sistema Operativo**

### 🪟 **Windows**

#### Paso 1: Instalar R
1. Ve a [CRAN R Project](https://cran.r-project.org/)
2. Haz clic en **"Download R for Windows"**
3. Selecciona **"base"**
4. Descarga **"Download R-4.x.x for Windows"** (última versión)
5. Ejecuta el instalador como administrador
6. Sigue las instrucciones del instalador (acepta todas las opciones por defecto)

#### Paso 2: Instalar RStudio
1. Ve a [RStudio Download](https://www.rstudio.com/products/rstudio/download/#download)
2. Descarga **"RStudio Desktop"** (versión gratuita)
3. Ejecuta el instalador
4. Sigue las instrucciones del instalador

#### Paso 3: Verificar Instalación
```r
# Abrir RStudio y ejecutar:
R.version
sessionInfo()
```

---

### 🍎 **macOS**

#### Paso 1: Instalar R
1. Ve a [CRAN R Project](https://cran.r-project.org/)
2. Haz clic en **"Download R for macOS"**
3. Descarga el archivo **".pkg"** más reciente
4. Abre el archivo y sigue las instrucciones del instalador

#### Paso 2: Instalar RStudio
1. Ve a [RStudio Download](https://www.rstudio.com/products/rstudio/download/#download)
2. Descarga **"RStudio Desktop"** para macOS
3. Abre el archivo **".dmg"**
4. Arrastra RStudio a la carpeta Applications

#### Paso 3: Verificar Instalación
```r
# Abrir RStudio y ejecutar:
R.version
sessionInfo()
```

---

### 🐧 **Linux (Ubuntu/Debian)**

#### Paso 1: Instalar R
```bash
# Actualizar repositorios
sudo apt update

# Instalar R
sudo apt install r-base r-base-dev

# Verificar instalación
R --version
```

#### Paso 2: Instalar RStudio
```bash
# Descargar RStudio
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.4.1717-amd64.deb

# Instalar dependencias
sudo apt install gdebi-core

# Instalar RStudio
sudo gdebi rstudio-1.4.1717-amd64.deb
```

#### Paso 3: Verificar Instalación
```r
# Abrir RStudio y ejecutar:
R.version
sessionInfo()
```

---

## 📦 **Configuración del Proyecto**

### Paso 1: Clonar/Descargar el Repositorio
```bash
# Opción 1: Clonar con Git
git clone https://github.com/tu-usuario/MaterialApoyo_R.git
cd MaterialApoyo_R

# Opción 2: Descargar ZIP
# Descargar desde GitHub y extraer
```

### Paso 2: Configurar RStudio
1. Abrir RStudio
2. **File > Open Project** > Seleccionar carpeta del proyecto
3. Verificar que el directorio de trabajo sea correcto:
```r
getwd()
# Debe mostrar la ruta a MaterialApoyo_R
```

### Paso 3: Instalar Paquetes Necesarios
```r
# Ejecutar el script de instalación automática
source("config/install_packages.R")

# O instalar manualmente los paquetes principales
install.packages(c(
  "tidyverse",
  "ggplot2",
  "dplyr",
  "readr",
  "plotly",
  "DT",
  "knitr",
  "rmarkdown"
))
```

### Paso 4: Cargar Utilidades
```r
# Cargar funciones útiles personalizadas
source("config/utilidades_utiles.R")

# Verificar que las funciones estén disponibles
info_sistema()
```

---

## 🛠️ **Configuración Avanzada**

### Configurar Git (Opcional)
```bash
# Configurar usuario de Git
git config --global user.name "Tu Nombre"
git config --global user.email "tu.email@ejemplo.com"

# Configurar editor por defecto
git config --global core.editor "code"  # Para VS Code
```

### Configurar RStudio Preferences
1. **Tools > Global Options**
2. **General:**
   - Desmarcar "Restore .RData into workspace at startup"
   - Cambiar "Save workspace" a "Never"
3. **Code:**
   - Marcar "Insert spaces for tab"
   - Marcar "Soft-wrap R source files"

### Configurar R Profile
```r
# El archivo .Rprofile ya está configurado en config/.Rprofile
# Se carga automáticamente al iniciar R

# Para personalizar, editar:
# config/.Rprofile
```

---

## 🔍 **Verificación de la Instalación**

### Script de Verificación Automática
```r
# Ejecutar script de verificación
source("config/test_paths.R")

# Este script verificará:
# - Existencia de archivos
# - Rutas correctas
# - Paquetes instalados
```

### Verificación Manual
```r
# 1. Verificar R
R.version

# 2. Verificar paquetes
installed.packages()[c("tidyverse", "ggplot2", "dplyr"), "Version"]

# 3. Verificar directorio de trabajo
getwd()

# 4. Verificar archivos del proyecto
list.files()
list.files("datasets/")
```

---

## 🆘 **Solución de Problemas**

### Problema: "R no se encuentra"
**Windows:**
```bash
# Agregar R al PATH
# 1. Buscar "Variables de entorno" en el menú inicio
# 2. Editar variables del sistema
# 3. Agregar ruta de R al PATH (ej: C:\Program Files\R\R-4.1.0\bin)
```

**macOS/Linux:**
```bash
# Verificar instalación
which R
whereis R

# Reinstalar si es necesario
```

### Problema: "Paquetes no se instalan"
```r
# Verificar conexión a internet
# Cambiar repositorio CRAN
options(repos = c(CRAN = "https://cran.r-project.org/"))

# Instalar paquetes uno por uno
install.packages("tidyverse")
install.packages("ggplot2")
```

### Problema: "Archivos no se encuentran"
```r
# Verificar directorio de trabajo
getwd()

# Cambiar directorio si es necesario
setwd("ruta/a/MaterialApoyo_R")

# Verificar archivos
list.files()
file.exists("README.md")
```

### Problema: "RStudio no abre"
**Windows:**
- Ejecutar como administrador
- Verificar antivirus
- Reinstalar RStudio

**macOS:**
```bash
# Permitir RStudio en Seguridad y Privacidad
# System Preferences > Security & Privacy > General
```

**Linux:**
```bash
# Verificar dependencias
sudo apt install libjpeg62 libpng16-16 libtiff5
```

---

## 📞 **Obtener Ayuda**

### Recursos de Ayuda
- **R Help:** `help.start()` en R
- **RStudio Help:** Help > RStudio Docs
- **Stack Overflow:** [R Tag](https://stackoverflow.com/questions/tagged/r)
- **RStudio Community:** [community.rstudio.com](https://community.rstudio.com/)

### Comandos Útiles de Diagnóstico
```r
# Información del sistema
sessionInfo()
Sys.info()

# Paquetes instalados
installed.packages()

# Directorio de trabajo
getwd()

# Archivos en directorio
list.files()

# Memoria disponible
memory.size()  # Windows
gc()  # Limpiar memoria
```

---

## ✅ **Checklist de Instalación**

### Instalación Básica
- [ ] R instalado y funcionando
- [ ] RStudio instalado y funcionando
- [ ] Proyecto descargado/clonado
- [ ] Directorio de trabajo configurado

### Configuración del Proyecto
- [ ] Paquetes necesarios instalados
- [ ] Scripts de configuración ejecutados
- [ ] Archivos de datos accesibles
- [ ] Utilidades cargadas

### Verificación Final
- [ ] Script de verificación ejecutado sin errores
- [ ] Primer ejercicio ejecutado exitosamente
- [ ] Gráfico básico creado
- [ ] Documento R Markdown renderizado

---

**🎉 ¡Una vez completado este checklist, estarás listo para usar el MaterialApoyo_R!**
