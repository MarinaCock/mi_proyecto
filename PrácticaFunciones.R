##practica de funciones

library(gapminder)
str(gapminder)

## si quiero saber la diferencia entre el maximo y el minimo, uso funciones ya existente en R
max(gapminder$lifeExp)-min(gapminder$lifeExp)
##ahora convierto eso en una funcion
max_minus_min <- function(x) max(x) - min (x)
max_minus_min(gapminder$lifeExp)
max_minus_min(gapminder$country)

##para que arroje error en caso de no numerico uso lo sig
max_minus_min_corregida <- function(x){
  stopifnot(is.numeric(x)) 
  max(x)- min(x)
}
funcion2 <- function(x) {
  if(!is.numeric(x)) {
    stop('I am so sorry, but this function only works for numeric input!\n',
         'You have provided an object of class: ', class(x)[1])
  }
  max(x) - min(x)
}
funcion2
