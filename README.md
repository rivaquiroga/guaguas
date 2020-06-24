
<!-- README.md is generated from README.Rmd. Please edit that file -->

# guaguas

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/guaguas)](https://CRAN.R-project.org/package=guaguas)
<!-- badges: end -->

Datos de nombres de guaguas (bebés) registrados en Chile entre 1920 y
2019, según el Servicio de Registro Civil e Identificación. Incluye
todos los nombres con al menos 15 ocurrencias. Este *dataset* permite
explorar tendencias en los nombres registrados durante el último siglo y
puede utilizarse como fuente de datos de práctica para enseñar/aprender
R.

## Instalación

``` r
# install.packages("devtools")
devtools::install_github("rivaquiroga/guaguas")
```

## Datos

El dataframe `guaguas` contiene cuatro variables y un total de 84565
observaciones:

| variable     | descripción                                                       |
| ------------ | ----------------------------------------------------------------- |
| `anio`       | año de inscripción                                                |
| `sexo`       | sexo registral                                                    |
| `n`          | número de ocurrencias del nombre                                  |
| `proporcion` | proporción del nombre respecto del total de inscripciones del año |

## Ejemplos

A continuación se muestran algunos ejemplos de exploración de estos
datos.

#### El contexto político en los años sesenta y setenta

Los dos momentos en que aumentan las inscripciones con el nombre
*Salvador* en los años sesenta y setenta coinciden con elecciones
presidenciales en las que se presentó Salvador Allende como candidato
(1964, 1970). El año siguiente de su elección como presidente (1971) es
el año con mayor cantidad de inscripciones en esas décadas. Luego del
Golpe Militar los registros comienzan a bajar y encuentran su punto más
bajo en 1978. El nombre *Augusto*, por su parte, sube en los registros
en 1973 y 1974, pero luego vuelve a bajar.

``` r
library(guaguas)
library(dplyr)
library(stringr)
library(ggplot2)
library(forcats)
library(hrbrthemes)
library(ggthemes)

guaguas %>% 
  filter(nombre %in% c("Salvador", "Augusto"), anio >= 1960 & anio <= 1979) %>% 
  ggplot(aes(anio, n, color = fct_reorder2(nombre, n, anio))) + 
  geom_line() +
  scale_color_colorblind() +
  labs(x = "año", y = "total inscripciones", color = "nombre", 
       title = "Inscripciones de 'Salvador' y 'Augusto' entre 1960 - 1979") +
  theme_ipsum()
```

<img src="man/figures/salvador-augusto.png">

#### El efecto “Romané” en el año 2000

Según [IMDB](https://www.imdb.com/list/ls006742360/),
[Romané](https://es.wikipedia.org/wiki/Roman%C3%A9) ha sido una de las
teleseries más vistas en Chile. Emitida el año 2000, el nombre de su
protagonista reaparece en la lista de inscritas con más de 15
ocurrencias ese año.

``` r
guaguas %>% 
  filter(str_detect(nombre, "(Y|J)ovanka"))
#> # A tibble: 4 x 5
#>    anio sexo  nombre      n proporcion
#>   <dbl> <chr> <chr>   <int>      <dbl>
#> 1  1963 F     Jovanka    17  0.0000597
#> 2  1973 F     Yovanka    16  0.0000506
#> 3  2000 F     Jovanka    30  0.000116 
#> 4  2000 F     Yovanka    21  0.0000813
```

También aumentaron las inscripciones de nombres de otros personajes de
la teleserie:

``` r
guaguas %>% 
  filter(nombre %in% c("Milenka", "Branco", "Salomé"), anio > 1980) %>% 
  ggplot(aes(anio, n, color = nombre)) + 
  geom_line() +
  scale_color_colorblind() +
  labs(x = "año", y = "total inscripciones",
       title = "Inscripciones de nombres de personajes de 'Romané'") +
  theme_ipsum()
```

<img src="man/figures/romane.png">

#### Ídolos musicales

Alguno de los nombres de integrantes de los [Backstreet
Boys](https://es.wikipedia.org/wiki/Backstreet_Boys) aumentaron hacia
fines de la década de los noventa. Como suele ocurrir con nombres en
inglés, es posible encontrar variaciones en la forma de escribirlos:
*Brian*, *Bryan*, *Brayan*.

``` r
guaguas %>% 
  filter(nombre %in% c("Brian", "Kevin", "Bryan", "Brayan")) %>% 
  ggplot(aes(anio, n, color = fct_reorder2(nombre, anio, n))) +
  geom_line() +
  scale_color_colorblind() +
  labs(x = "año", y = "total inscripciones", color = "nombre",
       title = "El efecto 'Backstreet Boys'") +
  theme_ipsum()
```

<img src="man/figures/bsb.png">

<p align="center">

<img src="man/figures/por-que-me-llamo-brian.JPG" width="300">

</p>

<p align="center">

Un cartel visto durante la presentación de los Backstreet Boys en el
Festival de Viña del Mar 2019.
Fuente:<a href="https://www.fmtiempo.cl/tendencias/galeria-los-mejores-carteles-que-dejo-el-paso-de-los-backstreet-boys-en-vina/">
FMTiempo</a>

</p>

## Fuente de los datos

Los datos fueron obtenidos a través del Portal de Transparencia del
Sistema de Registro Civil e Identificación de Chile.

## Etimología

La palabra *guagua* viene del quechua *wawa* y es la forma que en Chile
y algunos países de Sudamérica se utiliza para referirse a un/a bebé.

## Paquetes similares

  - [`babynames`](https://github.com/hadley/babynames) (nombres
    registrados en EE. UU.)
  - [`prenoms`](https://github.com/ThinkR-open/prenoms) (nombres
    registrados en Francia)
