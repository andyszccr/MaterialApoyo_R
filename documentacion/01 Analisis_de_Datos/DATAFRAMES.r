Nombres <- c('Juan','Maria')
Edades <- c(15,14)
Aprobado <- c(TRUE,FALSE)
x <- cbind(Nombres,Edades,Aprobado)
df <- data.frame(Nombres,Edades,Aprobado)
summary(df)

### ACCEDIENDO A DATOS 

data()
Y <- infert
Y$age
Y[1,2]
y <- Y[1:5,1:3]
Y[,c('parity','case')]
attach(Y)
age # accede a la columna age por nombre
detach(Y)


## AGREGAR FILAS Y COLUMNAS
## 1 libra = 0.454 kg
## 1 pulgada = 0.0254m

W <- women
alturam <- W$height*0.0254
pesokg <- W$weight*0.454
W <- cbind(W,alturam,pesokg)
fila <- c(34,56,123,57)
rbind(W,fila)
fila <- c(34,56,123,57)
W <- rbind(W,fila)
W <- W[-c(16),]

## IMC peso/estatura^2

imc <- W$pesokg/W$alturam^2
W <- cbind(W,imc)
W <- W[,-c(1,2,5)]

## ORDENANDO Y FILTRANDO DATOS
I <- iris[,c(1,2)]
i <- order(-I$Sepal.Length)
I2 <- I[i,]
ii <- order(I$Sepal.Length,-I$Sepal.Width)
I3 <- I[ii,]


subset(W,pesokg > 60 & pesokg < 70 )

subset(W,pesokg > 60 & alturam < 1.70 )


subset(W,pesokg > 60 & alturam < 1.70, select = c(alturam,imc))



