#' Tabla resumen de temperatura
#'
#' Calcula la media y el desvío estándar de una variable de temperatura para
#' cada estación y devuelve una tabla con una fila por estadístico y una
#' columna por estación. Sirve tanto para una como para varias estaciones.
#'
#' @param datos Un `data.frame` o `tibble` con los datos de una o más
#'   estaciones. Tiene que tener la columna `id` y la variable que se quiere
#'   resumir.
#' @param variable Nombre de la variable de temperatura que se quiere resumir,
#'   escrito como texto (entre comillas). Por defecto es
#'   `"temperatura_abrigo_150cm"`.
#'
#' @return Un `tibble` con dos filas (`media` y `desvio`) y una columna por
#'   estación.
#'
#' @examples
#' tabla_resumen_temperatura(estaciones)
#'
#' tabla_resumen_temperatura(estaciones, "temperatura_abrigo_150cm_minima")
#'
#' @importFrom rlang .data
#' @export
tabla_resumen_temperatura <- function(datos, variable = "temperatura_abrigo_150cm") {
  if (!is.data.frame(datos)) {
    cli::cli_abort(c(
      "datos tiene que ser un data frame o un tibble.",
      "i" = "Recib\u00ed un {class(datos)[1]}."
    ))
  }

  if (nrow(datos) == 0) {
    cli::cli_abort("datos no tiene filas para resumir.")
  }

  if (!"id" %in% names(datos)) {
    cli::cli_abort("datos tiene que tener una columna id.")
  }

  if (!is.character(variable) || length(variable) != 1) {
    cli::cli_abort(c(
      "variable tiene que ser el nombre de una columna escrito entre comillas, por ejemplo \"temperatura_abrigo_150cm\".",
      "i" = "Recib\u00ed un {class(variable)[1]} de largo {length(variable)}."
    ))
  }

  if (!variable %in% names(datos)) {
    cli::cli_abort(c(
      "No existe la columna {variable} en datos.",
      "i" = "Pod\u00e9s ver los nombres de las columnas con names(datos)."
    ))
  }

  if (!is.numeric(datos[[variable]])) {
    cli::cli_abort(c(
      "La columna {variable} tiene que ser num\u00e9rica.",
      "i" = "Es de tipo {class(datos[[variable]])[1]}."
    ))
  }

  datos |>
    dplyr::group_by(id) |>
    dplyr::summarise(
      media = mean(.data[[variable]], na.rm = TRUE),
      desvio = stats::sd(.data[[variable]], na.rm = TRUE)
    ) |>
    tidyr::pivot_longer(
      cols = c("media", "desvio"),
      names_to = "variable",
      values_to = "valor"
    ) |>
    tidyr::pivot_wider(names_from = id, values_from = valor)
}
