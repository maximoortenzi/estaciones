#' Descarga el archivo de una estación
#'
#' Descarga el archivo `CSV` de una estación meteorológica desde el repositorio
#' del libro y lo guarda en la ruta indicada. Es una función auxiliar de
#' `datos_estacion()` y no se exporta. Si la carpeta de destino no existe, la
#' crea.
#'
#' @param id Código de la estación, por ejemplo `"NH0437"`.
#' @param ruta_archivo Ruta del archivo donde se guardan los datos, por ejemplo
#'   `"datos/NH0437.csv"`.
#'
#' @return La ruta del archivo descargado, de forma invisible.
#'
#' @noRd
descarga_estacion <- function(id, ruta_archivo) {
  carpeta <- dirname(ruta_archivo)
  if (!dir.exists(carpeta)) {
    dir.create(carpeta, recursive = TRUE)
  }

  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id, ".csv"
  )

  estado <- suppressWarnings(tryCatch(
    utils::download.file(url, ruta_archivo, quiet = TRUE),
    error = function(e) NA_integer_
  ))

  if (is.na(estado) || estado != 0) {
    unlink(ruta_archivo)
    cli::cli_abort(c(
      "No se pudo descargar la estaci\u00f3n {.val {id}}.",
      "i" = "Revis\u00e1 que el c\u00f3digo exista y que haya conexi\u00f3n a internet.",
      "x" = "La direcci\u00f3n que se intent\u00f3 fue {.url {url}}."
    ))
  }

  invisible(ruta_archivo)
}

#' Descarga y lee los datos de una estación
#'
#' Descarga el archivo `CSV` de una estación meteorológica del INTA y lo lee
#' como un `tibble`. Si el archivo ya existe en la ruta indicada no lo vuelve a
#' descargar, solo lo lee. Sirve para cualquier estación que tenga su archivo
#' en el repositorio del libro: solo hay que pasarle su identificador. Hoy el
#' repositorio tiene las cinco estaciones de Santa Fe que trae el paquete en
#' [estaciones].
#'
#' @param id Código de la estación, por ejemplo `"NH0437"`.
#' @param ruta_archivo Ruta donde se guarda (o donde ya está) el archivo, por
#'   ejemplo `"datos/NH0437.csv"`. Si la carpeta no existe, se crea.
#'
#' @return Un `tibble` con una fila por fecha y una columna por variable
#'   meteorológica.
#'
#' @examples
#' # En tu proyecto usarías una ruta como "datos/NH0910.csv". Acá guardamos el
#' # archivo en una carpeta temporal para no dejar archivos sueltos.
#' ruta <- file.path(tempdir(), "NH0910.csv")
#'
#' las_rosas <- datos_estacion("NH0910", ruta)
#' las_rosas
#'
#' @export
datos_estacion <- function(id, ruta_archivo) {
  if (!is.character(id) || length(id) != 1 || is.na(id) || id == "") {
    cli::cli_abort(c(
      "id tiene que ser un solo texto con el c\u00f3digo de una estaci\u00f3n, por ejemplo \"NH0437\".",
      "i" = "Recib\u00ed un {class(id)[1]} de largo {length(id)}."
    ))
  }

  if (
    !is.character(ruta_archivo) || length(ruta_archivo) != 1 ||
      is.na(ruta_archivo) || ruta_archivo == ""
  ) {
    cli::cli_abort(c(
      "ruta_archivo tiene que ser un solo texto con la ruta del archivo, por ejemplo \"datos/NH0437.csv\".",
      "i" = "Recib\u00ed un {class(ruta_archivo)[1]} de largo {length(ruta_archivo)}."
    ))
  }

  if (!file.exists(ruta_archivo)) {
    descarga_estacion(id, ruta_archivo)
    cli::cli_inform(c("v" = "Se descarg\u00f3 la estaci\u00f3n {id} en {ruta_archivo}"))
  }

  cli::cli_inform(c("v" = "Leyendo los datos"))
  readr::read_csv(ruta_archivo, show_col_types = FALSE)
}
