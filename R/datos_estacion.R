#' Descarga el archivo de una estacion
#'
#' Descarga el archivo `CSV` de una estacion meteorologica desde el repositorio
#' del libro y lo guarda en la ruta indicada. Es una funcion auxiliar de
#' `datos_estacion()` y no se exporta. Si la carpeta de destino no existe, la
#' crea.
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
  dir.create(dirname(file), recursive = TRUE, showWarnings = FALSE)

  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id, ".csv"
  )

  estado <- suppressWarnings(tryCatch(
    utils::download.file(url, file, quiet = TRUE),
    error = function(e) NA_integer_
  ))

  if (is.na(estado) || estado != 0) {
    unlink(file)
    cli::cli_abort(c(
      "No se pudo descargar la estaci\u00f3n {.val {id}}.",
      "i" = "Revis\u00e1 que el c\u00f3digo exista y que haya conexi\u00f3n a internet.",
      "x" = "La direcci\u00f3n que se intent\u00f3 fue {.url {url}}."
    ))
  }

  invisible(file)
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
#'   ejemplo `"datos/NH0437.csv"`. Si la carpeta no existe, se crea.
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
  if (!is.character(id) || length(id) != 1 || is.na(id) || !nzchar(id)) {
    cli::cli_abort(
      "{.arg id} tiene que ser el c\u00f3digo de una estaci\u00f3n, por ejemplo {.val NH0437}."
    )
  }

  if (
    !is.character(ruta_archivo) || length(ruta_archivo) != 1 ||
      is.na(ruta_archivo) || !nzchar(ruta_archivo)
  ) {
    cli::cli_abort(
      "{.arg ruta_archivo} tiene que ser la ruta de un archivo, por ejemplo {.val datos/NH0437.csv}."
    )
  }

  file <- here::here(ruta_archivo)

  if (!file.exists(file)) {
    descarga_estacion(id, ruta_archivo)
    cli::cli_inform(c("v" = "Se descarg\u00f3 la estaci\u00f3n {id} en {ruta_archivo}"))
  }

  cli::cli_inform(c("v" = "Leyendo los datos"))
  readr::read_csv(file, show_col_types = FALSE)
}
