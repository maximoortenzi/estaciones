# descarga_estacion()
# Descarga el archivo CSV de una estación meteorológica desde el repositorio
# del libro y lo guarda en la ruta indicada. Si la carpeta de destino no
# existe, la crea. Es una función auxiliar de datos_estacion() y no se exporta.
#
# Argumentos:
#   id: código de la estación, por ejemplo "NH0437".
#   ruta_archivo: ruta donde se guarda el archivo, por ejemplo
#     "datos/NH0437.csv".
#
# Resultado: deja el archivo guardado en ruta_archivo. Si la estación no existe
# o no hay conexión, download.file() frena con un error y no guarda nada.
descarga_estacion <- function(id, ruta_archivo) {
  carpeta <- dirname(ruta_archivo)
  if (!dir.exists(carpeta)) {
    dir.create(carpeta, recursive = TRUE)
  }

  url <- paste0(
    "https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
    id, ".csv"
  )

  utils::download.file(url, ruta_archivo, quiet = TRUE)
}

#' Descarga y lee los datos de una estación
#'
#' Descarga el archivo `CSV` de una estación meteorológica del INTA y lo lee
#' como un `tibble`. Si el archivo ya existe en la ruta indicada no lo vuelve a
#' descargar, solo lo lee. Sirve para cualquier estación: solo hay que pasarle
#' su identificador.
#'
#' @param id Código de la estación, por ejemplo `"NH0437"`.
#' @param ruta_archivo Ruta donde se guarda (o donde ya está) el archivo, por
#'   ejemplo `"datos/NH0437.csv"`. Si la carpeta no existe, se crea.
#'
#' @return Un `tibble` con una fila por fecha y una columna por variable
#'   meteorológica.
#'
#' @examples
#' estacion_NH0437 <- datos_estacion("NH0437", "datos/NH0437.csv")
#' estacion_NH0437
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
