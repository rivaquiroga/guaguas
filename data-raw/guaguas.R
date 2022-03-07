
guaguas <- readr::read_csv("data-raw/1920-2021.csv") %>%
  dplyr::arrange(anio, desc(n))

guaguas_frecuentes <- guaguas %>%
  dplyr::filter(n >= 15)

usethis::use_data(guaguas, guaguas_frecuentes, internal = TRUE, overwrite = TRUE)
