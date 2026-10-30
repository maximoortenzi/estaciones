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
