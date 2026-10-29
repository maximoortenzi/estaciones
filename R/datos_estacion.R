descarga_estacion <- function(id, ruta_archivo) {
  file <- here::here(ruta_archivo)
  url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/",
                id, ".csv")
  utils::download.file(url, file, quiet = TRUE)
}

datos_estacion <- function(id, ruta_archivo) {
  file <- here::here(ruta_archivo)
  if (!file.exists(file)) {
    descarga_estacion(id, ruta_archivo)
    cli::cli_inform(c("v" = "Descargado la estacion {id} en {ruta_archivo}"))
  }
  cli::cli_inform(c("v" = "Leyendo los datos"))
  readr::read_csv(file, show_col_types = FALSE)
}

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
      color = "Estacion"
    ) +
    ggplot2::theme_minimal()
}
