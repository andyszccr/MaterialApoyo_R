format(Sys.Date(), "%a %b %d")

fechas <- c("2feb2002","28mar2012")

fechas_f <- as.Date(fechas, "%d%b%Y")

fechas2 <- c("03/24/97","08/07/87")
as.Date(fechas2,"%m/%d/%y")

?strptime

## SERIES DE TIEMPO

library(tidyverse)
library(lubridate)

data_bici <- read_csv('2022-06.csv')

viajes <- data_bici %>% 
  mutate(fechahora = dmy_hms(paste(Fecha_Retiro,Hora_Retiro))) %>%
  filter( fechahora >= as.Date('2022-06-20'),
          fechahora <= as.Date('2022-06-25')) %>%
  group_by(horas = floor_date(fechahora, unit ='hour')) %>%
  summarise(numero = n())

completas <- data.frame(
  horas = seq(
    floor_date(min(viajes$horas),unit = 'hour'),
    floor_date(max(viajes$horas),unit = 'hour'),
    by = 'hour'
  )
)

viajes <- completas %>%
  group_by(redondeo = floor_date(horas,unit = 'hour')) %>%
  left_join(viajes) %>%
  mutate(numero = ifelse(is.na(numero),0,numero))


ggplot(data = viajes,
       aes(x = horas,
           y= numero))+
  geom_line()

## Modelo Arima
