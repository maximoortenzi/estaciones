#' Promedio anual de temperatura
#'
#' Calcula el promedio de la temperatura de abrigo a 150 cm para cada estación
#' y cada año. Sirve para ver si la temperatura media cambia con el tiempo.
#'
#' Si una estación no tiene ningún dato de temperatura en un año, el promedio
#' de ese año es `NaN`.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o más
#'   estaciones. Tiene que tener las columnas `id`, `fecha` y
#'   `temperatura_abrigo_150cm`.
#'
#' @return Un `tibble` con una fila por estación y año, y las columnas `id`,
#'   `anio` y `temperatura_media` (en grados Celsius).
#'
#' @examples
#' promedio_anual_temperatura(estaciones)
#'
#' # Solo para Reconquista
#' estaciones |>
#'   dplyr::filter(id == "NH0437") |>
#'   promedio_anual_temperatura()
#'
#' @export
promedio_anual_temperatura <- function(datos) {
  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "datos tiene que ser un data frame o un tibble.",
      "i" = "Recib\u00ed un {class(datos)[1]}."
    ))
  }

  if (nrow(datos) == 0) {
    cli::cli_abort("datos no tiene filas para resumir.")
  }

  columnas <- c("id", "fecha", "temperatura_abrigo_150cm")

  if (!all(columnas %in% names(datos))) {
    cli::cli_abort(c(
      "datos tiene que tener las columnas id, fecha y temperatura_abrigo_150cm.",
      "x" = "Faltan: {columnas[!columnas %in% names(datos)]}."
    ))
  }

  if (!inherits(datos$fecha, c("Date", "POSIXt"))) {
    cli::cli_abort(c(
      "La columna fecha tiene que ser de tipo fecha.",
      "i" = "Es de tipo {class(datos$fecha)[1]}."
    ))
  }

  if (!is.numeric(datos$temperatura_abrigo_150cm)) {
    cli::cli_abort(c(
      "La columna temperatura_abrigo_150cm tiene que ser num\u00e9rica.",
      "i" = "Es de tipo {class(datos$temperatura_abrigo_150cm)[1]}."
    ))
  }

  datos |>
    dplyr::mutate(anio = lubridate::year(fecha)) |>
    dplyr::group_by(id, anio) |>
    dplyr::summarise(
      temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    )
}
