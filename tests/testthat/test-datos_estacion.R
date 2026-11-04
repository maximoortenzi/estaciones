test_that("datos_estacion descarga y lee los datos de una estacion", {
  expect_message(
    datos <- datos_estacion("NH0910", "datos-test/NH0910.csv"),
    "Leyendo los datos"
  )

  expect_true(is.data.frame(datos))
  expect_gt(nrow(datos), 0)
  expect_true("fecha" %in% names(datos))
  expect_true(file.exists("datos-test/NH0910.csv"))
})

test_that("crea la carpeta de destino si no existe", {
  expect_message(
    datos_estacion("NH0910", "datos-test/carpeta-nueva/NH0910.csv"),
    "Leyendo los datos"
  )

  expect_true(dir.exists("datos-test/carpeta-nueva"))
})

test_that("si el archivo ya existe lo lee sin descargarlo", {
  # ejemplo_NH0437.csv es un archivo chico que esta en tests/testthat
  expect_message(
    datos <- datos_estacion("NH0437", "ejemplo_NH0437.csv"),
    "Leyendo los datos"
  )

  expect_equal(nrow(datos), 3)
  expect_equal(datos$temperatura_abrigo_150cm, c(20.5, 21.3, 19.8))
})

test_that("frena con un error si la estacion no existe", {
  expect_error(
    suppressWarnings(datos_estacion("XX0000", "datos-test/XX0000.csv")),
    "cannot open URL"
  )

  expect_false(file.exists("datos-test/XX0000.csv"))
})

test_that("avisa si el id no es un solo texto", {
  mensaje <- "id tiene que ser un solo texto"

  expect_error(datos_estacion(123, "a.csv"), mensaje)
  expect_error(datos_estacion(c("NH0437", "NH0472"), "a.csv"), mensaje)
  expect_error(datos_estacion(NA_character_, "a.csv"), mensaje)
  expect_error(datos_estacion("", "a.csv"), mensaje)
})

test_that("avisa si la ruta no es un solo texto", {
  mensaje <- "ruta_archivo tiene que ser un solo texto"

  expect_error(datos_estacion("NH0437", 123), mensaje)
  expect_error(datos_estacion("NH0437", c("a.csv", "b.csv")), mensaje)
  expect_error(datos_estacion("NH0437", NA_character_), mensaje)
  expect_error(datos_estacion("NH0437", ""), mensaje)
})
