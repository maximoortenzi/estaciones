test_that("devuelve un ggplot con el titulo por defecto", {
  p <- grafico_temperatura_mensual(
    estaciones,
    colores = c("darkorange", "purple", "cyan4", "steelblue", "pink3")
  )

  expect_s3_class(p, "ggplot")
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

test_that("avisa si datos no es un data frame", {
  expect_error(
    grafico_temperatura_mensual(1:10, colores = "darkorange"),
    class = "rlang_error"
  )
})

test_that("avisa si faltan columnas", {
  sin_fecha <- dplyr::select(
    estaciones,
    id,
    temperatura_abrigo_150cm
  )

  expect_error(
    grafico_temperatura_mensual(sin_fecha, colores = "darkorange"),
    class = "rlang_error"
  )
})

test_that("avisa si fecha no es de tipo fecha", {
  con_texto <- dplyr::mutate(estaciones, fecha = as.character(fecha))

  expect_error(
    grafico_temperatura_mensual(con_texto, colores = "darkorange"),
    class = "rlang_error"
  )
})

test_that("avisa si la temperatura no es numerica", {
  con_texto <- dplyr::mutate(
    estaciones,
    temperatura_abrigo_150cm = as.character(temperatura_abrigo_150cm)
  )

  expect_error(
    grafico_temperatura_mensual(con_texto, colores = "darkorange"),
    class = "rlang_error"
  )
})

test_that("avisa si colores no es un vector de texto", {
  expect_error(
    grafico_temperatura_mensual(estaciones, colores = 1:5),
    class = "rlang_error"
  )
})

test_that("avisa si hay menos colores que estaciones", {
  expect_error(
    grafico_temperatura_mensual(estaciones, colores = "darkorange"),
    class = "rlang_error"
  )
})

test_that("avisa si el titulo no es un solo texto", {
  expect_error(
    grafico_temperatura_mensual(
      estaciones,
      colores = c("darkorange", "purple", "cyan4", "steelblue", "pink3"),
      titulo = c("uno", "dos")
    ),
    class = "rlang_error"
  )
  expect_error(
    grafico_temperatura_mensual(
      estaciones,
      colores = c("darkorange", "purple", "cyan4", "steelblue", "pink3"),
      titulo = 1
    ),
    class = "rlang_error"
  )
})
