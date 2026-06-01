##preparamos el R previamente a la creación del paquete
.libPaths() ##consulta o modifica directorios de R
install.packages("devtools")
install.packages("pak")
devtools::has_devel() ##me dice que mi sistema esta OK para hacer paquetes
devtools::dev_sitrep()
usethis::git_sitrep() ##comprobar como esta mi git
usethis::edit_r_profile() ##REPASAR COMO ARMAR ESTO

##armando el paquete
pak::pkg_name_check("minipkgMarina")  ##chequea que no haya otro paquete con este nombre
usethis::create_package("../minipkgMarina") ##los dos puntos significa que lo guarde denro de la carpeta que estoy trabajando. Aca tenes entre otras cosas la descripcion del paquete, se puede entrar a DESCRIPTION y rellenar toda la descripción, pero si lo completo bien en mi R profile se completa mejor la descripcion
devtools::check()##comprueba cosas del paquete  REVISAR PORQUE ME DA ERROR EN PACKAGE FILE
usethis::use_mit_license() ##crea dos archivos, el archivo license, es para Git, y otro para R
usethis::use_git() ##para que este disponible en git
