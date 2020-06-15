
# guaguas

<!-- badges: start -->

<!-- badges: end -->

Datos de nombres de guaguas (bebés) registrados en Chile entre 1920 y
2019, según el Servicio de Registro Civil e Identificación. Incluye
todos los nombres con al menos 15 ocurrencias.

El dataframe `guaguas` contiene cuatro variables: año, sexo registral,
nombre y número de ocurrencias del nombre.

## Instalación

``` r
# install.packages("devtools")
devtools::install_github("rivaquiroga/guaguas")
```

## Ejemplos

``` r
library(guaguas)
library(dplyr)
library(ggplot2)


guaguas %>% 
  filter(nombre %in% c("Salvador")) %>% 
  ggplot(aes(anio, n, color = nombre)) + geom_line()
```

## Etimología

La palabra *guagua* viene del quechua *wawa* y es la forma que en Chile
y otros países de Sudamérica se utiliza para referirse a un/a bebé.

## Paquetes similares

  - [`babynames`](https://github.com/hadley/babynames) (nombres
    registrados en EE. UU.)
  - [`prenoms`](https://github.com/ThinkR-open/prenoms) (nombres
    registrados en Francia)
