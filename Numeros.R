#Curso de R
#Ra
sqrt(16)

#valor absoluto 
abs(-5.7)

#rodendea los numeros
ceiling(6.7)

#no redondea
floor(5.7)

#--------------------------------------
#Condiciones if
a<-150
b<-235


if(a>b)
{
  print("a es mayor que b")  
}else{
  print("b es mayor que a")
}

c<-100
d<-100


if(c==d)
{
  cat("c y d son iguales")
}

#--------------------------------------
#Bucles for

i<-1
while(i<=10)
{
  #imprimimos los numeros
  print(i)
  
  i<-i+1
}


j<-10
while(j>=1)
{
  #imprimimos los numeros
  print(j)
  
  j<-j-1
}

#--------------------------------------
#Break


a<-1
while(a<=100)
{
  #imprimimos los numeros
  print(a)
  
  a<-a+1
  if (a==85)
  {
    #cat("Aqui termina",a)
    break
  }
}

a<-1
while(a<=100)
{
  #imprimimos los numeros
  print(a)
  
  a<-a+1
  if (a==85)
  {
    cat("Aqui continua",a)
    next
  }
}
#--------------------------------------
#Bucle for
for (x in 10:1) {
  print(x)
}

cars<-list("Tesla","BMW","TOYOTA","BYD")
for (x in cars) {
  print(x)
}

