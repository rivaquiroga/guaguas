#' @title Nombres de bebés (guaguas)
#' @description Set de datos con nombres de bebés
#' registrados en Chile entre 1920 y 2020, según el
#' Servicio de Registro Civil e Identificación. Incluye
#' solo aquellos inscritos como primer nombre y con
#' al menos 15 ocurrencias por año.
#' @format Un dataframe con 85463 filas y 5 variables
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
"guaguas_frecuentes"
