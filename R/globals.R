# Nombres de columnas que se usan dentro de funciones de dplyr y tidyr.
# R CMD check no puede saber que son columnas de un data.frame y las marca como
# variables globales sin definir, asi que se las declaramos explicitamente.
utils::globalVariables(
  c(
    "id",
    "fecha",
    "mes",
    "media",
    "desvio",
    "valor",
    "temperatura_media",
    "temperatura_abrigo_150cm"
  )
)
