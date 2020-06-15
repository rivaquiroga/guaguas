# los datos entregados por el Registro Civil incluyen los nombres registrados hasta mayo de 2020, por lo que solo se utilizarán los disponibles hasta el año 2019.

library(readxl)
library(dplyr)
library(stringr)

guaguas <- read_xlsx("data-raw/nombres_registro_civil.xlsx") %>%
  rename(anio = AÑO, sexo = SEXO, nombre = NOMBRE, n = CANTIDAD) %>%
  mutate(nombre = str_to_title(nombre)) %>%
  filter(anio != 2020) %>%
  arrange(anio, desc(n))

usethis::use_data(guaguas, overwrite = TRUE)
