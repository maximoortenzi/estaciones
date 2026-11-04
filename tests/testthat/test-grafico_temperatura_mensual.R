colores_santa_fe <- c("darkorange", "purple", "cyan4", "steelblue", "pink3")

test_that("devuelve un ggplot con el titulo por defecto", {
  p <- grafico_temperatura_mensual(estaciones, colores = colores_santa_fe)

  expect_true(ggplot2::is_ggplot(p))
  expect_equal(p$labels$title, "Temperatura")
})

test_that("respeta el titulo que se le pasa", {
  una_estacion <- dplyr::filter(estaciones, id == "NH0437")

  p <- grafico_temperatura_mensual(
    una_estacion,
    colores = "darkorange",
    titulo = "Reconquista"
  )

  expect_equal(p$labels$title, "Reconquista")
})

test_that("calcula un promedio por mes y por estacion", {
  p <- grafico_temperatura_mensual(estaciones, colores = colores_santa_fe)

  expect_equal(nrow(p$data), 12 * 5)
  expect_equal(sort(unique(p$data$mes)), 1:12)
})

test_that("elige colores al azar si no se pasan", {
  expect_message(
    p <- grafico_temperatura_mensual(estaciones),
    "se eligieron al azar"
  )

  expect_true(ggplot2::is_ggplot(p))
})

test_that("elige colores al azar si hay menos colores que estaciones", {
  expect_message(
    grafico_temperatura_mensual(estaciones, colores = "darkorange"),
    "se eligieron al azar"
  )
})

test_that("avisa si datos no es un data frame", {
  expect_error(
    grafico_temperatura_mensual(1:10, colores = "darkorange"),
    "datos tiene que ser un data frame"
  )
})

test_that("avisa si faltan columnas", {
  sin_fecha <- dplyr::select(estaciones, id, temperatura_abrigo_150cm)

  expect_error(
    grafico_temperatura_mensual(sin_fecha, colores = colores_santa_fe),
    "datos tiene que tener las columnas"
  )
})

test_that("avisa si fecha no es de tipo fecha", {
  con_texto <- dplyr::mutate(estaciones, fecha = as.character(fecha))

  expect_error(
    grafico_temperatura_mensual(con_texto, colores = colores_santa_fe),
    "La columna fecha tiene que ser de tipo fecha"
  )
})

test_that("avisa si la temperatura no es numerica", {
  con_texto <- dplyr::mutate(
    estaciones,
    temperatura_abrigo_150cm = as.character(temperatura_abrigo_150cm)
  )

  expect_error(
    grafico_temperatura_mensual(con_texto, colores = colores_santa_fe),
    "La columna temperatura_abrigo_150cm tiene que ser num"
  )
})

test_that("avisa si colores no es un vector de texto", {
  expect_error(
    grafico_temperatura_mensual(estaciones, colores = 1:5),
    "colores tiene que ser un vector de colores en texto"
  )
})

test_that("avisa si el titulo no es un solo texto", {
  mensaje <- "titulo tiene que ser un solo texto"

  expect_error(
    grafico_temperatura_mensual(
      estaciones,
      colores = colores_santa_fe,
      titulo = c("uno", "dos")
    ),
    mensaje
  )
  expect_error(
    grafico_temperatura_mensual(
      estaciones,
      colores = colores_santa_fe,
      titulo = 1
    ),
    mensaje
  )
})
