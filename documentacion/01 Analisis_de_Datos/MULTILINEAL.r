library('dplyr')
library('tidyr')
library('readxl')
insurance <- read.csv('insurance.csv')
insurance <- insurance %>% tibble::as_tibble()
cor(insurance$age,insurance$bmi)

insurance_num <- insurance %>% filter(smoker =='yes', bmi < 25, bmi>22 ) %>% select(age,bmi,children,charges)

plot(insurance_num)

cor(insurance_num)

library(corrplot)

C <- round(cor(insurance_num),1)

corrplot(C,method = 'number',type='upper')

corrplot(C,method = 'ellipse',type='upper')

corrplot.mixed(C)

modelo <- lm(charges ~ age+bmi,insurance_num)

modelo

summary(modelo)

modelo1 <- lm(charges ~ age+bmi+children,insurance_num)

modelo1

summary(modelo1)

## AJUSTE EXPONENCIAL

dataexp <- data.frame(periodo = c(0,1,2,3,4,5,6,7,8,9,10),
                      numero = c(1,2,4,8,16,32,64,128,256,512,1024))

plot(dataexp)

## y = A*exp(B*x) -> log(y) = log(A) +Bx

datalin <- dataexp %>% mutate(lny = log(numero))


plot(datalin$periodo,datalin$lny)

model <- lm( lny ~ periodo, datalin)

summary(model)








