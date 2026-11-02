test_that("devuelve media y desvio para cada estacion", {
  tabla <- tabla_resumen_temperatura(estaciones, temperatura_abrigo_150cm)

  expect_s3_class(tabla, "tbl_df")
  expect_equal(nrow(tabla), 2)
  expect_setequal(tabla$variable, c("media", "desvio"))
  expect_equal(ncol(tabla), 6)
})

test_that("funciona con una sola estacion", {
  una <- dplyr::filter(estaciones, id == "NH0437")

  tabla <- tabla_resumen_temperatura(una, temperatura_abrigo_150cm)

  expect_equal(ncol(tabla), 2)
  expect_equal(names(tabla)[2], "NH0437")
})

test_that("acepta la variable escrita como texto", {
  sin_comillas <- tabla_resumen_temperatura(
    estaciones,
    temperatura_abrigo_150cm
  )
  con_comillas <- tabla_resumen_temperatura(
    estaciones,
    "temperatura_abrigo_150cm"
  )

  expect_equal(sin_comillas, con_comillas)
})

test_that("avisa si datos no es un data frame", {
  expect_error(
    tabla_resumen_temperatura(1:10, temperatura_abrigo_150cm),
    class = "rlang_error"
  )
  expect_error(
    tabla_resumen_temperatura("datos", temperatura_abrigo_150cm),
    class = "rlang_error"
  )
})

test_that("avisa si datos no tiene filas", {
  vacio <- estaciones[0, ]

  expect_error(
    tabla_resumen_temperatura(vacio, temperatura_abrigo_150cm),
    class = "rlang_error"
  )
})

test_that("avisa si falta la columna id", {
  sin_id <- dplyr::select(estaciones, fecha, temperatura_abrigo_150cm)

  expect_error(
    tabla_resumen_temperatura(sin_id, temperatura_abrigo_150cm),
    class = "rlang_error"
  )
})

test_that("avisa si la variable no existe en los datos", {
  expect_error(
    tabla_resumen_temperatura(estaciones, temperatura_que_no_existe),
    class = "rlang_error"
  )
  expect_error(
    tabla_resumen_temperatura(estaciones, "temperatura_que_no_existe"),
    class = "rlang_error"
  )
})

test_that("avisa si la variable no es numerica", {
  expect_error(
    tabla_resumen_temperatura(estaciones, id),
    class = "rlang_error"
  )
  expect_error(
    tabla_resumen_temperatura(estaciones, fecha),
    class = "rlang_error"
  )
})
