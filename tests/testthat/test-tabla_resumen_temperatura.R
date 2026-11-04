test_that("calcula la media y el desvio de cada estacion", {
  datos_prueba <- data.frame(
    id = c("A", "A", "B", "B"),
    temperatura_abrigo_150cm = c(10, 20, 15, 25)
  )

  tabla <- tabla_resumen_temperatura(datos_prueba)

  expect_equal(tabla$variable, c("media", "desvio"))
  expect_equal(tabla$A, c(15, sd(c(10, 20))))
  expect_equal(tabla$B, c(20, sd(c(15, 25))))
})

test_that("ignora los NA al calcular", {
  datos_prueba <- data.frame(
    id = c("A", "A", "A"),
    temperatura_abrigo_150cm = c(10, NA, 20)
  )

  tabla <- tabla_resumen_temperatura(datos_prueba)

  expect_equal(tabla$A[1], 15)
})

test_that("devuelve una columna por estacion", {
  tabla <- tabla_resumen_temperatura(estaciones)

  expect_true(is.data.frame(tabla))
  expect_equal(nrow(tabla), 2)
  expect_equal(ncol(tabla), 6)
})

test_that("funciona con una sola estacion", {
  una <- dplyr::filter(estaciones, id == "NH0437")

  tabla <- tabla_resumen_temperatura(una)

  expect_equal(names(tabla), c("variable", "NH0437"))
})

test_that("resume otra variable si se la pasa como texto", {
  minima <- tabla_resumen_temperatura(
    estaciones,
    "temperatura_abrigo_150cm_minima"
  )
  media <- tabla_resumen_temperatura(estaciones)

  expect_equal(ncol(minima), 6)
  expect_true(all(minima[1, -1] < media[1, -1]))
})

test_that("resume otra variable si se la pasa sin comillas", {
  sin_comillas <- tabla_resumen_temperatura(
    estaciones,
    temperatura_abrigo_150cm_minima
  )
  con_comillas <- tabla_resumen_temperatura(
    estaciones,
    "temperatura_abrigo_150cm_minima"
  )

  expect_equal(sin_comillas, con_comillas)
})

test_that("avisa si datos no es un data frame", {
  mensaje <- "datos tiene que ser un data frame"

  expect_error(tabla_resumen_temperatura(1:10), mensaje)
  expect_error(tabla_resumen_temperatura("datos"), mensaje)
})

test_that("avisa si datos no tiene filas", {
  expect_error(
    tabla_resumen_temperatura(estaciones[0, ]),
    "datos no tiene filas"
  )
})

test_that("avisa si falta la columna id", {
  sin_id <- dplyr::select(estaciones, fecha, temperatura_abrigo_150cm)

  expect_error(
    tabla_resumen_temperatura(sin_id),
    "datos tiene que tener una columna id"
  )
})

test_that("avisa si la variable no es un solo texto", {
  mensaje <- "variable tiene que ser el nombre de una columna"

  expect_error(tabla_resumen_temperatura(estaciones, 1), mensaje)
  expect_error(
    tabla_resumen_temperatura(estaciones, c("fecha", "id")),
    mensaje
  )
  expect_error(tabla_resumen_temperatura(estaciones, ""), mensaje)
  expect_error(tabla_resumen_temperatura(estaciones, NA_character_), mensaje)
})

test_that("avisa si la variable no existe en los datos", {
  expect_error(
    tabla_resumen_temperatura(estaciones, "temperatura_que_no_existe"),
    "No existe la columna temperatura_que_no_existe"
  )
  expect_error(
    tabla_resumen_temperatura(estaciones, temperatura_que_no_existe),
    "No existe la columna temperatura_que_no_existe"
  )
})

test_that("avisa si la variable no es numerica", {
  expect_error(
    tabla_resumen_temperatura(estaciones, "id"),
    "La columna id tiene que ser num"
  )
  expect_error(
    tabla_resumen_temperatura(estaciones, "fecha"),
    "La columna fecha tiene que ser num"
  )
})
