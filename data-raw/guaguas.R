
guaguas <- readr::read_csv("data-raw/1920-2020.csv")

guaguas_frecuentes <- guaguas %>%
  dplyr::filter(n >= 15)

usethis::use_data(guaguas, guaguas_frecuentes, internal = TRUE, overwrite = TRUE)
