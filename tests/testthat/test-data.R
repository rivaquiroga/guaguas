# guaguas

test_that("guaguas nrow matches docs", {
  expect_equal(845400, nrow(guaguas))
})

test_that("guaguas years don't go below 1920", {
  anio_inicio <- 1920
  min_anio <- min(guaguas$anio)
  expect_equal(anio_inicio, min_anio)
})

test_that("guaguas sexo possible values are only two", {
  n_sexo_values <- 2
  sexo_values <- length(unique(guaguas$sexo))
  expect_equal(n_sexo_values, sexo_values)
})

# guaguas_frecuentes

test_that("guaguas_frecuentes nrow matches docs", {
  expect_equal(85463, nrow(guaguas_frecuentes))
})

test_that("guaguas_frecuentes n values don't go below 15", {
  minimo <- 15
  min_n <- min(guaguas_frecuentes$n)
  expect_equal(minimo, min_n)
})

test_that("guaguas_frecuentes sexo possible values are only two", {
  n_sexo_values <- 2
  sexo_values <- length(unique(guaguas_frecuentes$sexo))
  expect_equal(n_sexo_values, sexo_values)
})

test_that("guaguas_frecuentes years don't go below 1920", {
  anio_inicio <- 1920
  min_anio <- min(guaguas_frecuentes$anio)
  expect_equal(anio_inicio, min_anio)
})
