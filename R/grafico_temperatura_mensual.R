#' Gráfico de temperatura mensual
#'
#' Calcula el promedio mensual de la temperatura de abrigo a 150 cm de cada
#' estación y devuelve un gráfico de líneas con una línea por estación. Sirve
#' tanto para una como para varias estaciones.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o más
#'   estaciones. Tiene que tener las columnas `id`, `fecha` y
#'   `temperatura_abrigo_150cm`.
#' @param colores Vector de colores (texto), uno por estación. Por ejemplo
#'   `c("darkorange", "purple", "cyan4", "steelblue", "pink3")`. Es opcional:
#'   si no se pasa, o si tiene menos colores que estaciones, se eligen colores
#'   al azar con `colors()`.
#' @param titulo Título del gráfico. Por defecto es `"Temperatura"`.
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
#' # Sin colores: se eligen al azar
#' grafico_temperatura_mensual(estaciones)
#'
#' @export
grafico_temperatura_mensual <- function(datos, colores = NULL, titulo = "Temperatura") {
  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "datos tiene que ser un data frame o un tibble.",
      "i" = "Recib\u00ed un {class(datos)[1]}."
    ))
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

  if (!is.null(colores) && !is.character(colores)) {
    cli::cli_abort(c(
      "colores tiene que ser un vector de colores en texto, por ejemplo \"darkorange\".",
      "i" = "Recib\u00ed un {class(colores)[1]}."
    ))
  }

  if (!is.character(titulo) || length(titulo) != 1 || is.na(titulo)) {
    cli::cli_abort(c(
      "titulo tiene que ser un solo texto, por ejemplo \"Temperatura\".",
      "i" = "Recib\u00ed un {class(titulo)[1]} de largo {length(titulo)}."
    ))
  }

  cantidad_estaciones <- length(unique(datos$id))

  # Si no hay un color por estacion, se eligen colores al azar
  if (is.null(colores) || length(colores) < cantidad_estaciones) {
    colores <- sample(grDevices::colors(), cantidad_estaciones)
    cli::cli_inform(c(
      "i" = "No hab\u00eda un color por estaci\u00f3n, as\u00ed que se eligieron al azar."
    ))
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
