# los datos entregados por el Registro Civil incluyen los nombres registrados hasta mayo de 2020, por lo que solo se utilizarán los disponibles hasta el año 2019.

library(readxl)
library(dplyr)
library(stringr)
library(lubridate)

nombres <- read_xlsx("data-raw/nombres_registro_civil.xlsx") %>%
  rename(anio = AÑO, sexo = SEXO, nombre = NOMBRE, n = CANTIDAD) %>%
  mutate(nombre = str_to_title(nombre)) %>%
  filter(anio != 2020) %>%
  arrange(anio, desc(n))

nacimientos <- read_xlsx("data-raw/nacimientos_registro_civil.xlsx") %>%
  select(anio = `AÑO INSC NAC`, tiporegistro = `REGISTRO NAC`, cantidad) %>%
  group_by(anio) %>%
  summarise(inscritos = sum(cantidad))

guaguas <- left_join(nombres, nacimientos) %>%
  mutate(n = as.integer(n)) %>%
  mutate(proporcion = zapsmall(n / inscritos)) %>%
  select(-inscritos)

usethis::use_data(guaguas, overwrite = TRUE)
