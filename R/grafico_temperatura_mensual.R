#' Grafico de temperatura mensual
#'
#' Calcula el promedio mensual de la temperatura de abrigo a 150 cm de cada
#' estacion y devuelve un grafico de lineas con una linea por estacion. Sirve
#' tanto para una como para varias estaciones.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o mas
#'   estaciones. Tiene que tener las columnas `id`, `fecha` y
#'   `temperatura_abrigo_150cm`.
#' @param colores Vector de colores, uno por estacion. Por ejemplo
#'   `c("darkorange", "purple", "cyan4", "steelblue", "pink3")`.
#' @param titulo Titulo del grafico. Por defecto es `"Temperatura"`.
#'
#' @return Un objeto `ggplot` con el ciclo anual de temperatura.
#'
#' @examples
#' grafico_temperatura_mensual(
#'   estaciones,
#'   colores = c("darkorange", "purple", "cyan4", "steelblue", "pink3"),
#'   titulo = "Ciclo anual de temperatura"
#' )
#'
#' @export
grafico_temperatura_mensual <- function(datos, colores, titulo = "Temperatura") {
  if (!is.data.frame(datos)) {
    cli::cli_abort(
      "{.arg datos} tiene que ser un data frame o un tibble, no {.cls {class(datos)[1]}}."
    )
  }

  faltantes <- setdiff(
    c("id", "fecha", "temperatura_abrigo_150cm"),
    names(datos)
  )

  if (length(faltantes) > 0) {
    cli::cli_abort(c(
      "{.arg datos} tiene que tener las columnas {.field id}, {.field fecha} y {.field temperatura_abrigo_150cm}.",
      "x" = "No encontr\u00e9: {.field {faltantes}}."
    ))
  }

  if (!inherits(datos$fecha, c("Date", "POSIXt"))) {
    cli::cli_abort(
      "La columna {.field fecha} tiene que ser de tipo fecha, no {.cls {class(datos$fecha)[1]}}."
    )
  }

  if (!is.numeric(datos$temperatura_abrigo_150cm)) {
    cli::cli_abort(
      "La columna {.field temperatura_abrigo_150cm} tiene que ser num\u00e9rica, no {.cls {class(datos$temperatura_abrigo_150cm)[1]}}."
    )
  }

  if (!is.character(colores)) {
    cli::cli_abort(
      "{.arg colores} tiene que ser un vector de colores en texto, por ejemplo {.val darkorange}."
    )
  }

  ids_estaciones <- unique(datos$id)

  if (length(colores) < length(ids_estaciones)) {
    cli::cli_abort(c(
      "Se necesita un color por estaci\u00f3n.",
      "x" = "Estaciones: {length(ids_estaciones)}. Colores: {length(colores)}.",
      "i" = "Agreg\u00e1 al menos {length(ids_estaciones) - length(colores)} m\u00e1s a {.arg colores}."
    ))
  }

  if (!is.character(titulo) || length(titulo) != 1 || is.na(titulo)) {
    cli::cli_abort(
      "{.arg titulo} tiene que ser un solo texto, por ejemplo {.val Temperatura}."
    )
  }

  datos |>
    dplyr::group_by(id, mes = lubridate::month(fecha)) |>
    dplyr::summarise(
      temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      .groups = "drop"
    ) |>
    ggplot2::ggplot(ggplot2::aes(mes, temperatura_media)) +
    ggplot2::geom_line(ggplot2::aes(color = id)) +
    ggplot2::scale_color_manual(values = colores) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura media",
      color = "Estaci\u00f3n"
    ) +
    ggplot2::theme_minimal()
}
