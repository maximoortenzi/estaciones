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
