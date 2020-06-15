#' @importFrom tibble tibble
NULL

#' @title Nombres de bebés (guaguas)
#' @description Set de datos con nombres de bebés registrados en Chile
#' entre 1920 y 2019, según el Servicio de Registro Civil
#' e Identificación. Incluye todos los nombres con al
#' menos 15 ocurrencias.
#' @format Un dataframe con 84565 filas y 5 variables
#' \describe{
#'   \item{anio}{Año de inscripción}
#'   \item{sexo}{Sexo registral}
#'   \item{nombre}{Nombre}
#'   \item{n}{Frecuencia del nombre ese año}
#'   \item{proporcion}{\code{n} dividido por el total de inscripciones de ese año}
#' }
#' @source Servicio de Registro Civil e Identificación
#'     de Chile
"guaguas"
