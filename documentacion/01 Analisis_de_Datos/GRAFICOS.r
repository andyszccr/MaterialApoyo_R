# tidyverse
# ggplot2

library(tidyverse)

I <- iris

ggplot(data = I) + 
  geom_point(aes(x=Petal.Length,y=Petal.Width, col=Species))

ggplot(data = I) + 
  geom_point(aes(x=Petal.Length,y=Petal.Width, shape=Species))


ggplot(data = I) + 
  geom_point(aes(x=Petal.Length,y=Petal.Width, col=Species), 
             #col='red',
             size=3,
             alpha = 1/5)

## transformaciones estadisticas

ggplot(data = I) + 
  geom_point(aes(x=Petal.Length,y=Petal.Width, col=Species), 
             #col='red',
             size=3,
             alpha = 1/5)+
  geom_smooth(aes(x=Petal.Length,y=Petal.Width,linetype=Species),
              method='lm',
              col='darkgreen',
              se=FALSE)

## graficos condicionados

ggplot(data = I) + 
  geom_point(aes(x=Petal.Length,y=Petal.Width, col=Species), 
             #col='red',
             size=3,
             alpha = 1/5)+
  geom_smooth(aes(x=Petal.Length,y=Petal.Width,linetype=Species),
              method='lm',
              col='darkgreen',
              se=FALSE)+
  facet_wrap( ~ Species,nrow=3)

ggplot(data = I) + 
  geom_point(aes(x=Petal.Length,y=Petal.Width, col=Species), 
             #col='red',
             size=3,
             alpha = 1/5)+
  geom_smooth(aes(x=Petal.Length,y=Petal.Width),
              method='lm',
              col='darkgreen',
              se=FALSE)+
  labs(title='Grafica de Prueba',
       x='Longitud',
       y='Ancho')+
  theme_minimal(base_family="mono")


### Diagramas de líneas

x <- seq(-4,4,0.01)
data <- data.frame(x=x,y=sin(x),z=cos(2*x))

ggplot(data)+
  geom_line(aes(x=x,y=y),col='red')+
  geom_line(aes(x=x,y=z),linetype=2,col='darkgreen')

### GRAFICAS DE BARRAS

ggplot(data = I)+
  geom_bar(aes(x=Species),
           width=0.4,
           fill='cyan')+
  theme_minimal()

frecuencias <- data.frame(categoria=c('M','N','P'),freq=c(20,10,70))

ggplot(data = frecuencias)+
  geom_bar(aes(x=categoria,y=freq),
           stat='identity',
           width = 0.4,
           fill = 'green')+
  theme_classic()

## HISTOGRAMAS 

ggplot(data = I)+
  geom_histogram(aes(x = Petal.Length, y=..density..),
                 bins = 10,
                 fill = 'lightblue',
                 col = 'black')+
  facet_wrap(~ Species, nrow=3)

## GRAFICOS DE CAJAS

ggplot(I)+
  geom_boxplot(aes(x=Species,y=Petal.Width))+
  coord_flip()+
  geom_jitter(aes(x=Species, y =Petal.Width ),
              size=3,
              alpha=0.2,
              width=0.2)


summary(filter(I,Species == 'setosa'))


### https://www.tidyverse.org/





