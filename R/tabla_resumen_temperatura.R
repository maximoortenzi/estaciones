#' Tabla resumen de temperatura
#'
#' Calcula la media y el desvio estandar de una variable de temperatura para
#' cada estacion y devuelve una tabla con una fila por estadistico y una
#' columna por estacion. Sirve tanto para una como para varias estaciones.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o mas
#'   estaciones. Tiene que tener la columna `id` y la variable que se quiere
#'   resumir.
#' @param variable La variable de temperatura que se quiere resumir, sin
#'   comillas. Por ejemplo `temperatura_abrigo_150cm`.
#'
#' @return Un `tibble` con dos filas (`media` y `desvio`) y una columna por
#'   estacion.
#'
#' @examples
#' tabla_resumen_temperatura(estaciones, temperatura_abrigo_150cm)
#'
#' tabla_resumen_temperatura(estaciones, temperatura_abrigo_150cm_minima)
#'
#' @export
tabla_resumen_temperatura <- function(datos, variable) {
  datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      media = mean({{ variable }}, na.rm = TRUE),
      desvio = stats::sd({{ variable }}, na.rm = TRUE)
    ) |>
    tidyr::pivot_longer(
      cols = c("media", "desvio"),
      names_to = "variable",
      values_to = "valor"
    ) |>
    tidyr::pivot_wider(names_from = id, values_from = valor)
}
