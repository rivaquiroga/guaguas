#' @importFrom tibble tibble
NULL

#' @title Nombres de bebés (guaguas)
#' @description Set de datos con nombres de bebés registrados en Chile
#' entre 1920 y 2019, según el Servicio de Registro Civil
#' e Identificación. Incluye todos los nombres con al
#' menos 15 ocurrencias.
#' @format Un dataframe con 84565 filas y 4 variables
#' \describe{
#'   \item{anio}{Año}
#'   \item{sexo}{Sexo registral}
#'   \item{nombre}{Nombre}
#'   \item{n}{Frecuencia del nombre ese año}
#' }
#' @source Servicio de Registro Civil e Identificación
#'     de Chile
"guaguas"
