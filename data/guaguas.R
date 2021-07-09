delayedAssign("guaguas", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(guaguas:::guaguas)
  } else {
    guaguas:::guaguas
  }
}))

delayedAssign("guaguas_frecuentes", local({
  if (requireNamespace("tibble", quietly = TRUE)) {
    tibble::as_tibble(guaguas:::guaguas_frecuentes)
  } else {
    guaguas:::guaguas_frecuentes
  }
}))
