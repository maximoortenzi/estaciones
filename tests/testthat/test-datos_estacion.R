test_that("datos_estacion devuelve un tibble", {
  skip_if_offline()

  ruta <- tempfile(fileext = ".csv")

  datos <- suppressWarnings(datos_estacion("NH0437", ruta))

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
