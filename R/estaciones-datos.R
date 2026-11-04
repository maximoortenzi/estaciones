#' Datos meteorológicos de cinco estaciones de Santa Fe
#'
#' Observaciones diarias de cinco estaciones meteorológicas del INTA de la
#' provincia de Santa Fe: Oliveros (NH0472), Las Rosas (NH0910), Zavalla
#' (NH0046), Rafaela (NH0098) y Reconquista (NH0437). Los datos cubren el
#' período entre 1956 y 2023.
#'
#' Algunas columnas quedaron como `logical` con todos sus valores perdidos
#' (`NA`) porque no tienen datos para estas estaciones en el archivo original.
#' Es esperable y no es un error del paquete.
#'
#' @format Un `tibble` con 95681 filas y 35 variables:
#' \describe{
#'   \item{id}{código de la estación}
#'   \item{fecha}{fecha de la observación}
#'   \item{temperatura_abrigo_150cm}{temperatura de abrigo a 150 cm (grados Celsius)}
#'   \item{temperatura_abrigo_150cm_maxima}{temperatura máxima de abrigo a 150 cm}
#'   \item{temperatura_abrigo_150cm_minima}{temperatura mínima de abrigo a 150 cm}
#'   \item{temperatura_intemperie_5cm_minima}{temperatura mínima a la intemperie a 5 cm}
#'   \item{temperatura_intemperie_50cm_minima}{temperatura mínima a la intemperie a 50 cm}
#'   \item{temperatura_suelo_5cm_media}{temperatura media del suelo a 5 cm}
#'   \item{temperatura_suelo_10cm_media}{temperatura media del suelo a 10 cm}
#'   \item{temperatura_inte_5cm}{temperatura a la intemperie a 5 cm}
#'   \item{temperatura_intemperie_150cm_minima}{temperatura mínima a la intemperie a 150 cm}
#'   \item{humedad_suelo}{humedad del suelo}
#'   \item{precipitacion_pluviometrica}{precipitación (milímetros)}
#'   \item{granizo}{registro de granizo}
#'   \item{nieve}{registro de nieve}
#'   \item{heliofania_efectiva}{horas de sol efectivas}
#'   \item{heliofania_relativa}{horas de sol relativas}
#'   \item{tesion_vapor_media}{tensión de vapor media (el nombre es el del archivo original)}
#'   \item{humedad_media}{humedad media}
#'   \item{humedad_media_8_14_20}{humedad media de las 8, 14 y 20 horas}
#'   \item{rocio_medio}{punto de rocío medio}
#'   \item{duracion_follaje_mojado}{duración del follaje mojado}
#'   \item{velocidad_viento_200cm_media}{velocidad media del viento a 200 cm}
#'   \item{direccion_viento_200cm}{dirección del viento a 200 cm}
#'   \item{velocidad_viento_1000cm_media}{velocidad media del viento a 1000 cm}
#'   \item{direccion_viento_1000cm}{dirección del viento a 1000 cm}
#'   \item{velocidad_viento_maxima}{velocidad máxima del viento}
#'   \item{presion_media}{presión atmosférica media}
#'   \item{radiacion_global}{radiación global}
#'   \item{radiacion_neta}{radiación neta}
#'   \item{evaporacion_tanque}{evaporación del tanque}
#'   \item{evapotranspiracion_potencial}{evapotranspiración potencial}
#'   \item{profundidad_napa}{profundidad de la napa}
#'   \item{horas_frio}{horas de frío acumuladas}
#'   \item{unidad_frio}{unidades de frío acumuladas}
#' }
#'
#' @examples
#' estaciones
#'
#' @source Instituto Nacional de Tecnología Agropecuaria (INTA), a través del
#'   Sistema de Información y Gestión Agrometeorológica
#'   ([SIGA](https://siga.inta.gob.ar/)). Los archivos se descargaron del
#'   repositorio del libro:
#'   <https://github.com/rse-r/intro-programacion/tree/main/datos>
"estaciones"

#' Metadatos de las estaciones meteorológicas
#'
#' Información de 258 estaciones meteorológicas del INTA: ubicación,
#' coordenadas, altura y período de funcionamiento de cada una. Sirve para
#' sumarle a los datos diarios la ubicación de cada estación uniendo las tablas
#' por la columna `id`.
#'
#' @format Un `tibble` con 258 filas y 11 variables:
#' \describe{
#'   \item{id}{código de la estación}
#'   \item{nombre}{nombre de la estación}
#'   \item{tipo}{tipo de estación}
#'   \item{localidad}{localidad donde se encuentra}
#'   \item{provincia}{provincia donde se encuentra}
#'   \item{lat}{latitud}
#'   \item{lon}{longitud}
#'   \item{altura}{altura sobre el nivel del mar (metros)}
#'   \item{ubicacion}{dirección de la estación}
#'   \item{desde}{fecha desde la que hay registros}
#'   \item{hasta}{fecha hasta la que hay registros}
#' }
#'
#' @examples
#' metadatos
#'
#' # Ubicación de las cinco estaciones de Santa Fe
#' dplyr::filter(metadatos, id %in% unique(estaciones$id))
#'
#' @source Instituto Nacional de Tecnología Agropecuaria (INTA), a través del
#'   Sistema de Información y Gestión Agrometeorológica
#'   ([SIGA](https://siga.inta.gob.ar/)). El archivo se descargó del
#'   repositorio del libro:
#'   <https://github.com/rse-r/intro-programacion/blob/main/datos/metadatos_completos.csv>
"metadatos"
