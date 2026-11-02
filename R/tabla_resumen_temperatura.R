#' Tabla resumen de temperatura
#'
#' Calcula la media y el desvio estandar de una variable de temperatura para
#' cada estacion y devuelve una tabla con una fila por estadistico y una
#' columna por estacion. Sirve tanto para una como para varias estaciones.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o mas
#'   estaciones. Tiene que tener la columna `id` y la variable que se quiere
#'   resumir.
#' @param variable La variable de temperatura que se quiere resumir. Se puede
#'   pasar sin comillas, por ejemplo `temperatura_abrigo_150cm`, o como texto,
#'   por ejemplo `"temperatura_abrigo_150cm"`.
#'
#' @return Un `tibble` con dos filas (`media` y `desvio`) y una columna por
#'   estacion.
#'
#' @examples
#' tabla_resumen_temperatura(estaciones, temperatura_abrigo_150cm)
#'
#' tabla_resumen_temperatura(estaciones, temperatura_abrigo_150cm_minima)
#'
#' @importFrom rlang .data
#' @export
tabla_resumen_temperatura <- function(datos, variable) {
  if (!is.data.frame(datos)) {
    cli::cli_abort(
      "{.arg datos} tiene que ser un data frame o un tibble, no {.cls {class(datos)[1]}}."
    )
  }

  if (nrow(datos) == 0) {
    cli::cli_abort("{.arg datos} no tiene filas para resumir.")
  }

  if (!"id" %in% names(datos)) {
    cli::cli_abort("{.arg datos} tiene que tener una columna {.field id}.")
  }

  nombre <- rlang::as_name(rlang::enquo(variable))

  if (!nombre %in% names(datos)) {
    cli::cli_abort(c(
      "No existe la columna {.field {nombre}} en {.arg datos}.",
      "i" = "Revis\u00e1 el nombre: pod\u00e9s ver las columnas con {.code names(datos)}."
    ))
  }

  if (!is.numeric(datos[[nombre]])) {
    cli::cli_abort(
      "La columna {.field {nombre}} tiene que ser num\u00e9rica, no {.cls {class(datos[[nombre]])[1]}}."
    )
  }

  datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      media = mean(.data[[nombre]], na.rm = TRUE),
      desvio = stats::sd(.data[[nombre]], na.rm = TRUE)
    ) |>
    tidyr::pivot_longer(
      cols = c("media", "desvio"),
      names_to = "variable",
      values_to = "valor"
    ) |>
    tidyr::pivot_wider(names_from = id, values_from = valor)
}
