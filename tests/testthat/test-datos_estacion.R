test_that("datos_estacion devuelve un tibble", {
  skip_if_offline()

  ruta <- tempfile(fileext = ".csv")

  datos <- suppressWarnings(suppressMessages(datos_estacion("NH0437", ruta)))

  expect_s3_class(datos, "tbl_df")
  expect_gt(nrow(datos), 0)
  expect_true("fecha" %in% names(datos))
})

test_that("si el archivo ya existe no lo vuelve a descargar", {
  ruta <- tempfile(fileext = ".csv")
  writeLines(
    c("id,fecha,temperatura_abrigo_150cm", "NH0437,2020-01-01,20.5"),
    ruta
  )

  datos <- datos_estacion("NH0437", ruta)

  expect_equal(nrow(datos), 1)
  expect_equal(datos$id, "NH0437")
})

test_that("no avisa que descargo si el archivo ya existe", {
  ruta <- tempfile(fileext = ".csv")
  writeLines(
    c("id,fecha,temperatura_abrigo_150cm", "NH0437,2020-01-01,20.5"),
    ruta
  )

  mensajes <- capture_messages(datos_estacion("NH0437", ruta))

  expect_false(any(grepl("Se descarg", mensajes)))
  expect_true(any(grepl("Leyendo los datos", mensajes)))
})

test_that("avisa si el id no es un solo texto", {
  expect_error(datos_estacion(123, tempfile()), class = "rlang_error")
  expect_error(
    datos_estacion(c("NH0437", "NH0472"), tempfile()),
    class = "rlang_error"
  )
  expect_error(datos_estacion(NA_character_, tempfile()), class = "rlang_error")
  expect_error(datos_estacion("", tempfile()), class = "rlang_error")
})

test_that("avisa si la ruta no es un solo texto", {
  expect_error(datos_estacion("NH0437", 123), class = "rlang_error")
  expect_error(datos_estacion("NH0437", c("a.csv", "b.csv")), class = "rlang_error")
  expect_error(datos_estacion("NH0437", NA_character_), class = "rlang_error")
})

test_that("crea la carpeta de destino si no existe", {
  skip_if_offline()

  carpeta <- file.path(tempdir(), paste0("estaciones-", sample(1e6, 1)))
  ruta <- file.path(carpeta, "NH0437.csv")

  expect_false(dir.exists(carpeta))

  suppressWarnings(suppressMessages(datos_estacion("NH0437", ruta)))

  expect_true(dir.exists(carpeta))
  expect_true(file.exists(ruta))
})

test_that("avisa con un mensaje claro si la descarga falla", {
  skip_if_offline()

  ruta <- tempfile(fileext = ".csv")

  expect_error(
    suppressMessages(datos_estacion("XX0000", ruta)),
    class = "rlang_error"
  )
  expect_false(file.exists(ruta))
})
