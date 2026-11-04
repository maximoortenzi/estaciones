# estaciones 0.0.0.9000

Primera versión con `datos_estacion()`, `tabla_resumen_temperatura()`,
`grafico_temperatura_mensual()` y los datos `estaciones` y `metadatos`. Sobre
esa versión se sumó lo siguiente.

## Funciones nuevas

* `promedio_anual_temperatura()` calcula el promedio anual de la temperatura
  de abrigo a 150 cm de cada estación.
* `precipitacion_acumulada_mensual()` suma la precipitación de cada mes en
  cada estación y cuenta los días con dato.

## Cambios

* `tabla_resumen_temperatura()` recibe la variable como texto (entre comillas).
  Si no se la pasa, resume `temperatura_abrigo_150cm`.
* `grafico_temperatura_mensual()` elige colores al azar con `colors()` si no
  se le pasan colores o si hay menos colores que estaciones.
* `datos_estacion()` deja que `download.file()` frene con su propio error si
  la estación no existe, y el ejemplo de la documentación ahora se ejecuta.
* Los mensajes de error de todas las funciones son más simples y los tests
  revisan el texto de cada mensaje.

## Documentación

* La viñeta muestra cómo unir las estaciones con `rbind()` y cómo sumarles la
  ubicación con `left_join()` y `metadatos`.
* El README tiene una bienvenida, una tabla con todas las funciones y explica
  de dónde salen los datos.
* El código que arma los datos del paquete está en `data-raw/`.
* El código de conducta está en español.
