test_that("suma la precipitacion de cada estacion y cada mes", {
  datos_prueba <- data.frame(
    id = c("A", "A", "A", "B"),
    fecha = as.Date(c("2020-01-05", "2020-01-20", "2020-02-03", "2020-01-10")),
    precipitacion_pluviometrica = c(10, 5.5, 3, 20)
  )

  resultado <- precipitacion_acumulada_mensual(datos_prueba)

  expect_equal(
    names(resultado),
    c("id", "mes", "precipitacion_acumulada", "dias_con_dato")
  )
  expect_equal(resultado$id, c("A", "A", "B"))
  expect_equal(
    resultado$mes,
    as.Date(c("2020-01-01", "2020-02-01", "2020-01-01"))
  )
  expect_equal(resultado$precipitacion_acumulada, c(15.5, 3, 20))
  expect_equal(resultado$dias_con_dato, c(2, 1, 1))
})

test_that("separa el mismo mes de anios distintos", {
  datos_prueba <- data.frame(
    id = c("A", "A"),
    fecha = as.Date(c("2020-01-05", "2021-01-05")),
    precipitacion_pluviometrica = c(10, 30)
  )

  resultado <- precipitacion_acumulada_mensual(datos_prueba)

  expect_equal(nrow(resultado), 2)
  expect_equal(resultado$precipitacion_acumulada, c(10, 30))
})

test_that("cuenta los dias con dato para no confundir faltantes con 0", {
  datos_prueba <- data.frame(
    id = c("A", "A", "A"),
    fecha = as.Date(c("2020-01-05", "2020-01-06", "2020-02-05")),
    precipitacion_pluviometrica = c(10, NA, NA)
  )

  resultado <- precipitacion_acumulada_mensual(datos_prueba)

  expect_equal(resultado$precipitacion_acumulada, c(10, 0))
  expect_equal(resultado$dias_con_dato, c(1, 0))
})

test_that("funciona con los datos del paquete", {
  resultado <- precipitacion_acumulada_mensual(estaciones)

  expect_true(is.data.frame(resultado))
  expect_gte(min(resultado$precipitacion_acumulada), 0)
})

test_that("avisa si datos no es un data frame", {
  expect_error(
    precipitacion_acumulada_mensual("datos"),
    "datos tiene que ser un data frame"
  )
})

test_that("avisa si faltan columnas", {
  sin_lluvia <- dplyr::select(estaciones, id, fecha)

  expect_error(
    precipitacion_acumulada_mensual(sin_lluvia),
    "datos tiene que tener las columnas"
  )
})

test_that("avisa si fecha no es de tipo fecha", {
  con_texto <- dplyr::mutate(estaciones, fecha = as.character(fecha))

  expect_error(
    precipitacion_acumulada_mensual(con_texto),
    "La columna fecha tiene que ser de tipo fecha"
  )
})

test_that("avisa si la precipitacion no es numerica", {
  con_texto <- dplyr::mutate(
    estaciones,
    precipitacion_pluviometrica = as.character(precipitacion_pluviometrica)
  )

  expect_error(
    precipitacion_acumulada_mensual(con_texto),
    "La columna precipitacion_pluviometrica tiene que ser num"
  )
})
