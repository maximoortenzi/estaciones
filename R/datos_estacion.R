descarga_estacion <- function(id, ruta_archivo) {
  file <- here::here(ruta_archivo)
  url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
                id, ".csv")
  utils::download.file(url, file, quiet = TRUE)
}

datos_estacion <- function(id, ruta_archivo) {
  file <- here::here(ruta_archivo)
  if (!file.exists(file)) {
    descarga_estacion(id, ruta_archivo)
    cli::cli_inform(c("v" = "Descargado la estacion {id} en {ruta_archivo}"))
  }
  cli::cli_inform(c("v" = "Leyendo los datos"))
  readr::read_csv(file, show_col_types = FALSE)
}
