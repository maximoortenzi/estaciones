test_that("datos_estacion descarga y lee los datos de una estacion", {
  ruta <- file.path(tempfile("datos-estacion"), "NH0910.csv")
  on.exit(unlink(dirname(ruta), recursive = TRUE), add = TRUE)

  mensajes <- capture_messages(datos <- datos_estacion("NH0910", ruta))

  expect_true(any(grepl("Se descarg", mensajes)))
  expect_true(any(grepl("Leyendo los datos", mensajes)))
  expect_lt(grep("Se descarg", mensajes)[1], grep("Leyendo", mensajes)[1])
  expect_true(is.data.frame(datos))
  expect_gt(nrow(datos), 0)
  expect_true("fecha" %in% names(datos))
  expect_true(file.exists(ruta))
})

test_that("crea la carpeta de destino si no existe", {
  ruta <- file.path(tempfile("carpeta"), "NH0910.csv")
  on.exit(unlink(dirname(ruta), recursive = TRUE), add = TRUE)

  suppressMessages(datos_estacion("NH0910", ruta))

  expect_true(dir.exists(dirname(ruta)))
})

test_that("si el archivo ya existe lo lee sin descargarlo", {
  # ejemplo_NH0437.csv es un archivo chico que esta en tests/testthat
  ruta <- test_path("ejemplo_NH0437.csv")

  expect_message(
    datos <- datos_estacion("NH0437", ruta),
    "Leyendo los datos"
  )

  expect_equal(nrow(datos), 3)
  expect_equal(datos$temperatura_abrigo_150cm, c(20.5, 21.3, 19.8))
})

test_that("frena con un mensaje claro si la estacion no existe", {
  ruta <- file.path(tempfile("falla"), "XX0000.csv")
  on.exit(unlink(dirname(ruta), recursive = TRUE), add = TRUE)

  error <- tryCatch(
    suppressWarnings(datos_estacion("XX0000", ruta)),
    error = identity
  )

  expect_s3_class(error, "rlang_error")
  expect_match(conditionMessage(error), "No se pudo descargar")
  expect_false(file.exists(ruta))
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
