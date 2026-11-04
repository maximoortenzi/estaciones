test_that("calcula el promedio de cada estacion y cada anio", {
  datos_prueba <- data.frame(
    id = c("A", "A", "A", "B"),
    fecha = as.Date(c("2020-01-10", "2020-07-10", "2021-01-10", "2020-03-10")),
    temperatura_abrigo_150cm = c(10, 20, 15, 25)
  )

  resultado <- promedio_anual_temperatura(datos_prueba)

  expect_equal(names(resultado), c("id", "anio", "temperatura_media"))
  expect_equal(resultado$id, c("A", "A", "B"))
  expect_equal(resultado$anio, c(2020, 2021, 2020))
  expect_equal(resultado$temperatura_media, c(15, 15, 25))
})

test_that("ignora los NA y da NaN si un anio no tiene datos", {
  datos_prueba <- data.frame(
    id = c("A", "A", "A"),
    fecha = as.Date(c("2020-01-10", "2020-07-10", "2021-01-10")),
    temperatura_abrigo_150cm = c(10, NA, NA)
  )

  resultado <- promedio_anual_temperatura(datos_prueba)

  expect_equal(resultado$temperatura_media[1], 10)
  expect_true(is.nan(resultado$temperatura_media[2]))
})

test_that("funciona con los datos del paquete", {
  resultado <- promedio_anual_temperatura(estaciones)

  expect_true(is.data.frame(resultado))
  expect_equal(sort(unique(resultado$id)), sort(unique(estaciones$id)))
})

test_that("avisa si datos no tiene filas", {
  expect_error(
    promedio_anual_temperatura(estaciones[0, ]),
    "datos no tiene filas"
  )
})

test_that("avisa si datos no es un data frame", {
  expect_error(
    promedio_anual_temperatura(1:10),
    "datos tiene que ser un data frame"
  )
})

test_that("avisa si faltan columnas", {
  sin_fecha <- dplyr::select(estaciones, id, temperatura_abrigo_150cm)

  expect_error(
    promedio_anual_temperatura(sin_fecha),
    "datos tiene que tener las columnas"
  )
})

test_that("avisa si fecha no es de tipo fecha", {
  con_texto <- dplyr::mutate(estaciones, fecha = as.character(fecha))

  expect_error(
    promedio_anual_temperatura(con_texto),
    "La columna fecha tiene que ser de tipo fecha"
  )
})

test_that("avisa si la temperatura no es numerica", {
  con_texto <- dplyr::mutate(
    estaciones,
    temperatura_abrigo_150cm = as.character(temperatura_abrigo_150cm)
  )

  expect_error(
    promedio_anual_temperatura(con_texto),
    "La columna temperatura_abrigo_150cm tiene que ser num"
  )
})
