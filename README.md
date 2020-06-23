
<!-- README.md is generated from README.Rmd. Please edit that file -->

# guaguas

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/guaguas)](https://CRAN.R-project.org/package=guaguas)
[![Travis build
status](https://travis-ci.com/rivaquiroga/guaguas.svg?branch=master)](https://travis-ci.com/rivaquiroga/guaguas)
<!-- badges: end -->

Datos de nombres de guaguas (bebés) registrados en Chile entre 1920 y
2019, según el Servicio de Registro Civil e Identificación. Incluye
todos los nombres con al menos 15 ocurrencias.

El dataframe `guaguas` contiene cuatro variables: año de inscripción,
sexo registral, nombre, número de ocurrencias del nombre y proporción
del nombre respecto del total de inscripciones del año.

Los datos contenidos en este paquete permiten explorar algunas
tendencias en los nombres registrados en Chile durante el último siglo.
Puede utilizarse también como dataset de práctica para enseñar/aprender
R.

## Instalación

``` r
# install.packages("devtools")
devtools::install_github("rivaquiroga/guaguas")
```

## Ejemplos

A continuación se muestran algunos ejemplos de exploración de estos
datos.

### El contexto político en los años sesenta y setenta

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
library(gt)

guaguas %>% 
  filter(nombre %in% c("Salvador", "Augusto"), anio >= 1960 & anio <= 1979) %>% 
  ggplot(aes(anio, n, color = fct_reorder2(nombre, n, anio))) + 
  geom_line() +
  theme_minimal() +
  labs(x = "año", y = "total inscripciones", color = "nombre") +
  theme_ipsum()
```

<img src="man/figures/salvador-augusto.png">

### El efecto “Romané” en el año 2000

Según [IMDB](https://www.imdb.com/list/ls006742360/),
[Romané](https://es.wikipedia.org/wiki/Roman%C3%A9) ha sido una de las
teleseries más vistas en Chile. Emitida el año 2000, el nombre de su
protagonista reaparece en la lista de inscritas con más de 15
ocurrencias ese año.

``` r
guaguas %>% 
  filter(str_detect(nombre, "(Y|J)ovanka")) %>% 
  gt() %>% 
    cols_label(
    anio = "año",
    proporcion = "proporción"
  ) 
```

<!--html_preserve-->

<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#hzdaxzsffs .gt_table {
  display: table;
  border-collapse: collapse;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#hzdaxzsffs .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hzdaxzsffs .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#hzdaxzsffs .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 4px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#hzdaxzsffs .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hzdaxzsffs .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#hzdaxzsffs .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#hzdaxzsffs .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#hzdaxzsffs .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#hzdaxzsffs .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#hzdaxzsffs .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#hzdaxzsffs .gt_group_heading {
  padding: 8px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
}

#hzdaxzsffs .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#hzdaxzsffs .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#hzdaxzsffs .gt_from_md > :first-child {
  margin-top: 0;
}

#hzdaxzsffs .gt_from_md > :last-child {
  margin-bottom: 0;
}

#hzdaxzsffs .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#hzdaxzsffs .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#hzdaxzsffs .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hzdaxzsffs .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#hzdaxzsffs .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#hzdaxzsffs .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#hzdaxzsffs .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#hzdaxzsffs .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hzdaxzsffs .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#hzdaxzsffs .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#hzdaxzsffs .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#hzdaxzsffs .gt_left {
  text-align: left;
}

#hzdaxzsffs .gt_center {
  text-align: center;
}

#hzdaxzsffs .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#hzdaxzsffs .gt_font_normal {
  font-weight: normal;
}

#hzdaxzsffs .gt_font_bold {
  font-weight: bold;
}

#hzdaxzsffs .gt_font_italic {
  font-style: italic;
}

#hzdaxzsffs .gt_super {
  font-size: 65%;
}

#hzdaxzsffs .gt_footnote_marks {
  font-style: italic;
  font-size: 65%;
}
</style>

<div id="hzdaxzsffs" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">

<table class="gt_table">

<thead class="gt_col_headings">

<tr>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

año

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

sexo

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1">

nombre

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1">

n

</th>

<th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1">

proporción

</th>

</tr>

</thead>

<tbody class="gt_table_body">

<tr>

<td class="gt_row gt_right">

1963

</td>

<td class="gt_row gt_left">

F

</td>

<td class="gt_row gt_left">

Jovanka

</td>

<td class="gt_row gt_center">

17

</td>

<td class="gt_row gt_right">

0.00005966

</td>

</tr>

<tr>

<td class="gt_row gt_right">

1973

</td>

<td class="gt_row gt_left">

F

</td>

<td class="gt_row gt_left">

Yovanka

</td>

<td class="gt_row gt_center">

16

</td>

<td class="gt_row gt_right">

0.00005062

</td>

</tr>

<tr>

<td class="gt_row gt_right">

2000

</td>

<td class="gt_row gt_left">

F

</td>

<td class="gt_row gt_left">

Jovanka

</td>

<td class="gt_row gt_center">

30

</td>

<td class="gt_row gt_right">

0.00011614

</td>

</tr>

<tr>

<td class="gt_row gt_right">

2000

</td>

<td class="gt_row gt_left">

F

</td>

<td class="gt_row gt_left">

Yovanka

</td>

<td class="gt_row gt_center">

21

</td>

<td class="gt_row gt_right">

0.00008130

</td>

</tr>

</tbody>

</table>

</div>

<!--/html_preserve-->

También aumentaron las inscripciones de nombres de otros personajes de
la teleserie:

``` r
guaguas %>% 
  filter(nombre %in% c("Milenka", "Branco", "Salomé"), anio > 1980) %>% 
  ggplot(aes(anio, n, color = nombre)) + 
  geom_line() +
  theme_minimal() +
  labs(x = "año", y = "total inscripciones") +
  theme_ipsum()
```

<img src="man/figures/romane.png">

### Ídolos musicales

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
  theme_minimal() +
  labs(x = "año", y = "total inscripciones", color = "nombre") +
  theme_ipsum()
```

<img src="man/figures/bsb.png">

<p align="center">

<img src="man/figures/por-que-me-llamo-brian.JPG" width="400">

</p>

<div data-align="center">

Un cartel visto durante la presentación de los Backstreet Boys en el
Festival de Viña del Mar 2019 </br>Fuente de la imagen:
<a href="https://www.fmtiempo.cl/tendencias/galeria-los-mejores-carteles-que-dejo-el-paso-de-los-backstreet-boys-en-vina/">FMTiempo</a>

</div>

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
