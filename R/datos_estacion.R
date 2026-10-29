#' Descarga el archivo de una estacion
#'
#' Descarga el archivo `CSV` de una estacion meteorologica desde el repositorio
#' del libro y lo guarda en la ruta indicada. Es una funcion auxiliar de
#' `datos_estacion()` y no se exporta.
#'
#' @param id Codigo de la estacion, por ejemplo `"NH0437"`.
#' @param ruta_archivo Ruta del archivo donde se guardan los datos, por ejemplo
#'   `"datos/NH0437.csv"`.
#'
#' @return La ruta del archivo descargado, de forma invisible.
#'
#' @noRd
descarga_estacion <- function(id, ruta_archivo) {
  file <- here::here(ruta_archivo)
  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id, ".csv"
  )
  utils::download.file(url, file, quiet = TRUE)
}

#' Descarga y lee los datos de una estacion
#'
#' Descarga el archivo `CSV` de una estacion meteorologica del INTA y lo lee
#' como un `tibble`. Si el archivo ya existe en la ruta indicada no lo vuelve a
#' descargar, solo lo lee. Sirve para cualquier estacion: solo hay que pasarle
#' su identificador.
#'
#' @param id Codigo de la estacion, por ejemplo `"NH0437"`.
#' @param ruta_archivo Ruta donde se guarda (o donde ya esta) el archivo, por
#'   ejemplo `"datos/NH0437.csv"`.
#'
#' @return Un `tibble` con una fila por fecha y una columna por variable
#'   meteorologica.
#'
#' @examples
#' \dontrun{
#' estacion_NH0437 <- datos_estacion("NH0437", "datos/NH0437.csv")
#' estacion_NH0437
#' }
#'
#' @export
datos_estacion <- function(id, ruta_archivo) {
  file <- here::here(ruta_archivo)
  if (!file.exists(file)) {
    descarga_estacion(id, ruta_archivo)
    cli::cli_inform(c("v" = "Descargado la estaci\u00f3n {id} en {ruta_archivo}"))
  }
  cli::cli_inform(c("v" = "Leyendo los datos"))
  readr::read_csv(file, show_col_types = FALSE)
}
