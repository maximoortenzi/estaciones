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
