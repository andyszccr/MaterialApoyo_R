#Practica con Sampling y Analisis Exploratorio 

rm(list = ls())
install.packages("gapminder",dependencies = TRUE)
install.packages("openintro",dependencies = TRUE)
install.packages("dplyr",dependencies = TRUE)
install.packages(c("ggplot2"), dependencies = TRUE)

library(gapminder)
library(openintro)
library(dplyr)
library(ggplot2)

data("county")

glimpse(county)

#Analisis de la variable state
county2 <- county%>%
  group_by(state)%>%
  count()
head(county2, 20)

#Eliminar la informacion del estado Alabama
county_noAlabama <- county %>%
  filter(state != "Alabama") %>%
  droplevels()

head(county_noAlabama, 20)

#Muestreo simple
county_result <- county_noAlabama %>%
  sample_n(size=25)

glimpse(county_result)

#Grafico  para visualizar el muestreo
ggplot(county_result, aes(x = state, y = name)) +
  geom_point() 



#Analisis exploratorio de datos CUALITATIVOS
#Caso DC Comics
comics <- read.csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/comic-characters/dc-wikia-data.csv")


ggplot(comics,aes(x=ID,fill=ALIGN)) +
  geom_bar()

#Eliminar del analisis los que  tienen pocos valores
comics <- comics %>%
  filter(ALIGN != "Reformed Criminals") %>%
  droplevels()


ggplot(comics, aes(x = SEX, fill = ALIGN)) + 
  geom_bar(position = "dogde") +
  theme(axis.text.x = element_text(angle = 45))



#Cual tipo de Align(Bueno, malo, neutral) tiene mas super heroes masculinos
#R/

#Cual tipo de Align(Bueno, malo, neutral) tiene mas super heroes femeninos
#R/


#Conteo vs proporcion en grafico
ggplot(comics, aes(x = ALIGN, fill = SEX)) +
  geom_bar()

# Plot proportion of gender, conditional on align
ggplot(comics, aes(x = ALIGN, fill = SEX)) + 
  geom_bar(position = "fill")

#Distribucion de una variable
ggplot(comics, aes(x=ID,fill=ID)) +
  geom_bar()

ggplot(comics, aes(x=SEX,fill=SEX)) +
  geom_bar()

#Faceting
ggplot(comics, aes(x=ID,fill=ID)) +
  geom_bar() +
  facet_wrap(~ ALIGN)


#Analisis exploratorio de datos CUANTITATIVOS
#dataframe cars


cars <- read.csv("https://assets.datacamp.com/production/course_1796/datasets/cars04.csv")

str(cars)
glimpse(cars)

#Graficos Analisis
ggplot(data=cars,aes(x=weight)) +
  geom_dotplot(dotsize = 0.4)

ggplot(data=cars,aes(x=weight)) +
  geom_histogram()

ggplot(data=cars,aes(x=weight)) +
  geom_density()

ggplot(data=cars,aes(x=1,y=weight)) +
  geom_boxplot() 


ggplot(data=cars,aes(x=hwy_mpg)) + 
  geom_histogram() +
  facet_wrap(~pickup)

ggplot(data=cars,aes(x=hwy_mpg)) + 
  geom_histogram() +
  facet_wrap(~suv)



#Ejercio practica

table(cars$ncyl)
#1-Filtrar unicamente los carros con cilindros entre 4 y 8
#2-Crear un boxplot con con las variables de city_mpg y ncyl
#3-Crear un grafico de densidad con las mismas variables





#Medidas tendencia
library(gapminder)

str(gapminder)

gap2007 <- gapminder %>%
  filter(year==2007)

gap2007 %>%
  group_by(continent) %>%
  summarize(mean(lifeExp),
            median(lifeExp))

gap2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot()




