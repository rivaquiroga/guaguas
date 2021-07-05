#' @title Nombres de bebés (guaguas)
#' @description Set de datos con nombres de bebés
#' registrados en Chile entre 1920 y 2020, según el
#' Servicio de Registro Civil e Identificación. Incluyen
#' solo aquellos inscritos como primer nombre.
#' @format Un dataframe con 845400 filas y 5 variables
#' \describe{
#'   \item{anio}{Año de inscripción}
#'   \item{nombre}{Nombre}
#'   \item{sexo}{Sexo registral}
#'   \item{n}{Frecuencia del nombre ese año}
#'   \item{proporcion}{\code{n} dividido por el total de
#'    inscripciones de ese año}
#' }
#' @source Servicio de Registro Civil e Identificación
#'     de Chile
"guaguas"
