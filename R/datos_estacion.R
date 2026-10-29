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
