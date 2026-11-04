#' Precipitación acumulada mensual
#'
#' Suma la precipitación de cada mes para cada estación. El mes se obtiene con
#' `lubridate::floor_date()`, así que cada mes de cada año es un grupo
#' distinto.
#'
#' Los días sin dato (`NA`) no se cuentan en la suma. Por eso la tabla trae
#' también la cantidad de días con dato: un mes sin ningún dato da una
#' precipitación de 0 pero con `dias_con_dato` igual a 0, y no hay que
#' confundirlo con un mes sin lluvia.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o más
#'   estaciones. Tiene que tener las columnas `id`, `fecha` y
#'   `precipitacion_pluviometrica`.
#'
#' @return Un `tibble` con una fila por estación y mes, y las columnas `id`,
#'   `mes` (el primer día del mes), `precipitacion_acumulada` (en milímetros)
#'   y `dias_con_dato`.
#'
#' @examples
#' precipitacion_acumulada_mensual(estaciones)
#'
#' # Solo para Oliveros
#' estaciones |>
#'   dplyr::filter(id == "NH0472") |>
#'   precipitacion_acumulada_mensual()
#'
#' @export
precipitacion_acumulada_mensual <- function(datos) {
  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "datos tiene que ser un data frame o un tibble.",
      "i" = "Recib\u00ed un {class(datos)[1]}."
    ))
  }

  if (nrow(datos) == 0) {
    cli::cli_abort("datos no tiene filas para resumir.")
  }

  columnas <- c("id", "fecha", "precipitacion_pluviometrica")

  if (!all(columnas %in% names(datos))) {
    cli::cli_abort(c(
      "datos tiene que tener las columnas id, fecha y precipitacion_pluviometrica.",
      "x" = "Faltan: {columnas[!columnas %in% names(datos)]}."
    ))
  }

  if (!inherits(datos$fecha, c("Date", "POSIXt"))) {
    cli::cli_abort(c(
      "La columna fecha tiene que ser de tipo fecha.",
      "i" = "Es de tipo {class(datos$fecha)[1]}."
    ))
  }

  if (!is.numeric(datos$precipitacion_pluviometrica)) {
    cli::cli_abort(c(
      "La columna precipitacion_pluviometrica tiene que ser num\u00e9rica.",
      "i" = "Es de tipo {class(datos$precipitacion_pluviometrica)[1]}."
    ))
  }

  datos |>
    dplyr::group_by(id, mes = lubridate::floor_date(fecha, "month")) |>
    dplyr::summarise(
      precipitacion_acumulada = sum(precipitacion_pluviometrica, na.rm = TRUE),
      dias_con_dato = dplyr::n_distinct(
        fecha[!is.na(precipitacion_pluviometrica)]
      ),
      .groups = "drop"
    )
}
