#preparamos el R previamente a la creaci?n del paquete
.libPaths() ##consulta o modifica directorios de R
#install.packages("devtools") 
#install.packages("pak")
library(devtools)
library(pak)
library(usethis)

devtools::has_devel() #me dice que mi sistema esta OK para hacer paquetes
usethis::git_sitrep() #comprobar como esta mi git . Ahora si me dice  Default initial branch name: "main"
usethis::git_default_branch_rename()
usethis::git_default_branch_rediscover()
usethis::edit_r_profile() #bien hasta aca, listo mi perfil

##armando el paquete
pak::pkg_name_check("minipkgMarina")  ##chequea que no haya otro paquete con este nombre
usethis::create_package("../minipaquetemarina") ##los dos puntos significa que lo guarde denro de la carpeta que estoy trabajando. Aca tenes entre otras cosas la descripcion del paquete, se puede entrar a DESCRIPTION y rellenar toda la descripci?n, pero si lo completo bien en mi R profile se completa mejor la descripcion
devtools::check()#comprueba cosas del paquete. Ahora da todo bien salvo checking for future file timestamps ... NOTE
  #unable to verify current time
  #0 errors ✔ | 0 warnings ✔ | 1 note ✖

usethis::use_description() #edita la descripción
usethis::use_mit_license() #crea dos archivos, el archivo license, es para Git, y otro para R
usethis::use_git() #para que este disponible en git, esto me pone la pestaña git
#esta es la parte hasta el primer recreo


#creamos la funci?n para ver la hora
what_time <- function() {
  time <- format(Sys.time(), "%H:%M")
  sprintf("It is %s now!", time)
}
##sprintf("It is %s now!", time) ahi dice que ponga la hora donde esta el s?mbolo
devtools::load_all() ##esto lo que hace es cargar todos los paquetes
what_time()


#' Da la hora
#'
#' @param language idioma
#'
#' @returns da la hora
#' @export
#'
#' @examples
what_time <- function(language = "es") {

  if (!language %in% c("es", "en")) {
    stop("Either choose 'es' or 'en' as a language.")
  }

  time <- format(Sys.time(), "%H:%M")
  
  switch(
    language,
    es = sprintf("?Ahora son las %s!", time),
    en = sprintf("It is %s now!", time)
  )
  
}
## stop en la funcion le indica en que circunstancia tiene que dar mensaje de error



#encuentro 2. Para chequear que todo este bien se agrega la infrasectructura del test that y eso revisa todo
usethis::use_testthat()#no me agrega las herramientas
use_test("ArmandoPaquete") #vas al script de las pruebas
use_r() #vas al script de r donde estaba haciendo la funcion etc
devtools:: test_active_file() #este es el script que hace las pruebas y detecta el error
test() # este es de devtools y te revisa todo el paquete

test_that("what_time() works", {
  expect_type(what_time(), "character")
  expect_snapshot(error = TRUE, what_time(language = "bla"))
})  #snapshot test cheque el lenguaje, cheque que siempre que se pida un idioma que no es se devuelva un mismo error

test_that("bla() works", {
  withr::local_options(digits = 3)
  expect_snapshot(print(pi))
})
test_that("bla() works", {
  withr::local_options(digits = 5)
  expect_snapshot(print(pi))
})

#se hacen varios test_that segun lo necesario, se chequea sin funciona, si funciona cuando se pide algo raro, si funciona bien los errores... y puede haber mas

# archivo en tests/testthat/bla.txt
test_that("bla() works", {
  expect_snapshot(readLines(test_path("bla.txt")))
})
