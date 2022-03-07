# guaguas

test_that("guaguas nrow matches docs", {
  expect_equal(858782, nrow(guaguas))
})

test_that("guaguas years don't go below 1920", {
  anio_inicio <- 1920
  min_anio <- min(guaguas$anio)
  expect_equal(anio_inicio, min_anio)
})


# guaguas_frecuentes

test_that("guaguas_frecuentes nrow matches docs", {
  expect_equal(86366, nrow(guaguas_frecuentes))
})

test_that("guaguas_frecuentes n values don't go below 15", {
  minimo <- 15
  min_n <- min(guaguas_frecuentes$n)
  expect_equal(minimo, min_n)
})

test_that("guaguas_frecuentes years don't go below 1920", {
  anio_inicio <- 1920
  min_anio <- min(guaguas_frecuentes$anio)
  expect_equal(anio_inicio, min_anio)
})
