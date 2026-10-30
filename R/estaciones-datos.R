#' Datos meteorologicos de cinco estaciones de Santa Fe
#'
#' Observaciones diarias de cinco estaciones meteorologicas del INTA de la
#' provincia de Santa Fe: Oliveros (NH0472), Las Rosas (NH0910), Zavalla
#' (NH0046), Rafaela (NH0098) y Reconquista (NH0437). Los datos cubren el
#' periodo entre 1956 y 2023.
#'
#' Algunas columnas quedaron como `logical` con todos sus valores perdidos
#' (`NA`) porque no tienen datos para estas estaciones en el archivo original.
#' Es esperable y no es un error del paquete.
#'
#' @format Un `tibble` con 95681 filas y 35 variables:
#' \describe{
#'   \item{id}{codigo de la estacion}
#'   \item{fecha}{fecha de la observacion}
#'   \item{temperatura_abrigo_150cm}{temperatura de abrigo a 150 cm (grados Celsius)}
#'   \item{temperatura_abrigo_150cm_maxima}{temperatura maxima de abrigo a 150 cm}
#'   \item{temperatura_abrigo_150cm_minima}{temperatura minima de abrigo a 150 cm}
#'   \item{temperatura_intemperie_5cm_minima}{temperatura minima a la intemperie a 5 cm}
#'   \item{temperatura_intemperie_50cm_minima}{temperatura minima a la intemperie a 50 cm}
#'   \item{temperatura_suelo_5cm_media}{temperatura media del suelo a 5 cm}
#'   \item{temperatura_suelo_10cm_media}{temperatura media del suelo a 10 cm}
#'   \item{temperatura_inte_5cm}{temperatura a la intemperie a 5 cm}
#'   \item{temperatura_intemperie_150cm_minima}{temperatura minima a la intemperie a 150 cm}
#'   \item{humedad_suelo}{humedad del suelo}
#'   \item{precipitacion_pluviometrica}{precipitacion (milimetros)}
#'   \item{granizo}{registro de granizo}
#'   \item{nieve}{registro de nieve}
#'   \item{heliofania_efectiva}{horas de sol efectivas}
#'   \item{heliofania_relativa}{horas de sol relativas}
#'   \item{tesion_vapor_media}{tension de vapor media (el nombre es el del archivo original)}
#'   \item{humedad_media}{humedad media}
#'   \item{humedad_media_8_14_20}{humedad media de las 8, 14 y 20 horas}
#'   \item{rocio_medio}{punto de rocio medio}
#'   \item{duracion_follaje_mojado}{duracion del follaje mojado}
#'   \item{velocidad_viento_200cm_media}{velocidad media del viento a 200 cm}
#'   \item{direccion_viento_200cm}{direccion del viento a 200 cm}
#'   \item{velocidad_viento_1000cm_media}{velocidad media del viento a 1000 cm}
#'   \item{direccion_viento_1000cm}{direccion del viento a 1000 cm}
#'   \item{velocidad_viento_maxima}{velocidad maxima del viento}
#'   \item{presion_media}{presion atmosferica media}
#'   \item{radiacion_global}{radiacion global}
#'   \item{radiacion_neta}{radiacion neta}
#'   \item{evaporacion_tanque}{evaporacion del tanque}
#'   \item{evapotranspiracion_potencial}{evapotranspiracion potencial}
#'   \item{profundidad_napa}{profundidad de la napa}
#'   \item{horas_frio}{horas de frio acumuladas}
#'   \item{unidad_frio}{unidades de frio acumuladas}
#' }
#'
#' @examples
#' estaciones
#'
#' @source <https://github.com/rse-r/intro-programacion/tree/main/datos>
"estaciones"

#' Metadatos de las estaciones meteorologicas
#'
#' Informacion de las 258 estaciones meteorologicas disponibles en el
#' repositorio del libro: ubicacion, coordenadas, altura y periodo de
#' funcionamiento de cada una.
#'
#' @format Un `tibble` con 258 filas y 11 variables:
#' \describe{
#'   \item{id}{codigo de la estacion}
#'   \item{nombre}{nombre de la estacion}
#'   \item{tipo}{tipo de estacion}
#'   \item{localidad}{localidad donde se encuentra}
#'   \item{provincia}{provincia donde se encuentra}
#'   \item{lat}{latitud}
#'   \item{lon}{longitud}
#'   \item{altura}{altura sobre el nivel del mar (metros)}
#'   \item{ubicacion}{direccion de la estacion}
#'   \item{desde}{fecha desde la que hay registros}
#'   \item{hasta}{fecha hasta la que hay registros}
#' }
#'
#' @examples
#' metadatos
#'
#' @source <https://github.com/rse-r/intro-programacion/tree/main/datos>
"metadatos"
