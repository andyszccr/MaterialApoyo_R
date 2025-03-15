#limpiar datos
rm(list = ls())

data("mlb")
head(mlb, 20)

##              Ejercicions con el dataframe mlb                ##
#1-Seleccione todos los jugadores en la posicion de pitcher, pero unicamente el nombre y salario

mlb %>%
  filter(position == "Pitcher" ) %>%
  select(player, salary)


#2-Calcule cantidad jugadores por posicion, el salario promedio por posicion, 


mlb %>%
  group_by(position) %>% 
  summarise(cant=n(),
            mean_salary= mean(salary),
            min_salary= min(salary),
            max_salary= max(salary),
            total_salary=sum(salary)) %>% 
  arrange()

#el salario maximo y minimo, asi como el total
# dejar los valores en las siguientes variables: cant,mean_salary, min_salary,max_salary,total_salary



#3-Calcule la cantidad de jugadores por equipo, el monto total de planilla del equipo y el salario promedio

mlb %>%
  group_by(team) %>% 
  summarise(cant=n(),
            planilla=sum(salary),
            salario_promedio=mean(salary))
            


#4-Calcule la cantidad de jugadores por equipo y posicion, el monto total de planilla del equipo y el salario promedio

df<-mlb %>%
  group_by(position,team) %>% 
  summarise(cant=n(),
            planilla=sum(salary),
            salario_promedio=mean(salary),
            .groups = "drop") %>% 
  print(n=nrow(.))




data("births")
head(births, 20)
##               Ejercicios con el dataframe births               ##

#5-Calcule la diferencia de edad entre padre y madre en una nueva columna dif_parents y agreguelo en el dataframe


#6-Cuente el total de nacimientos por cada semana, tambien la cantidad por sexo bebe, tambien por si son fumadores o no

#7-cuenta la cantidad de nacimiento por edad padre y de la madre

#8-Genere el total de visitas y el peso promedio para los nacimientos por genero y estado prematuro


#9-Cuente la cantidad de nacimientos por semana de acuerdo a si son fumadores o no fumadores

#10-Calcule el peso promedio ganado por semana, sexo bebe y por prematuros