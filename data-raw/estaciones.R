# Código que arma los datos que trae el paquete: `estaciones` y `metadatos`.
#
# Se corre una sola vez, o cuando haya que actualizar los datos. La carpeta
# data-raw está en .Rbuildignore, así que no forma parte del paquete
# instalado: solo guarda cómo se generaron los archivos de data/.

url_datos <- "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/"

# Datos diarios de las cinco estaciones de Santa Fe
oliveros <- readr::read_csv(paste0(url_datos, "NH0472.csv"))
las_rosas <- readr::read_csv(paste0(url_datos, "NH0910.csv"))
zavalla <- readr::read_csv(paste0(url_datos, "NH0046.csv"))
rafaela <- readr::read_csv(paste0(url_datos, "NH0098.csv"))
reconquista <- readr::read_csv(paste0(url_datos, "NH0437.csv"))

# Todas las estaciones en un solo data.frame, una debajo de la otra
estaciones <- rbind(oliveros, las_rosas, zavalla, rafaela, reconquista)

# Ubicación y período de funcionamiento de las estaciones
metadatos <- readr::read_csv(paste0(url_datos, "metadatos_completos.csv"))

usethis::use_data(estaciones, overwrite = TRUE)
usethis::use_data(metadatos, overwrite = TRUE)
