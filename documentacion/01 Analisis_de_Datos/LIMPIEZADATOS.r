## dplyr
## tidyr
## readxl
library('dplyr')
library('tidyr')
library('readxl')
c1 <- read_excel(path="Calificaciones1.xlsx",sheet="Sheet1")
c2 <- read_excel(path="Calificaciones2.xlsx",sheet="Sheet1")

## uniendo bases de datos

C <- merge(c1,c2,by="id",all=TRUE)
dim(C)
C <- tbl_df(C)

############ USANDO dplyr

select(C,id,Fisica,Filosofia)
select(C,-Matematica)
filter(C,Matematica>5)
filter(C,Filosofia>Literatura & Filosofia > 7)
CN <- filter(C,!is.na(Matematica))
comp <- mutate(CN,numeros = (Matematica+Fisica)/2, letras = (Filosofia+Literatura)/2)
comp1 <- mutate(comp, comparacion = ifelse(numeros>letras,"N","L"))
comp2 <- arrange(comp1,desc(comparacion))

### el operador %>%

data_final <- C  %>% filter(!is.na(Matematica)) %>%
  mutate(numeros = (Matematica+Fisica)/2, letras = (Filosofia+Literatura)/2) %>%
  mutate(comparacion = ifelse(numeros>letras,"N","L"))  %>%
  arrange(id)  %>%
  select(id,numeros,letras,comparacion)



## USO DE tidyr

# gather()
S <- tbl_df(read_excel(path="Secciones.xlsx",sheet="Sheet1"))

S <- tbl_df(transform(S,Seccion=as.factor(Seccion)))

S1 <- gather(S,sexo,numero,Hombre,Mujer) %>% transform(sexo=as.factor(sexo))

S1 <- tbl_df(S1)

# spread()

S_old <- spread(S1,sexo,numero)

# separate()
M <- tbl_df(read_excel(path="Secciones.xlsx",sheet="Sheet2"))

M1 <- separate(M,Materia_nivel,c("materia","nivel"),sep="_")

# unite()

M_old <- unite(M1,materia_nivel,materia,nivel,sep="-")


