# Changelog

## estaciones 0.0.0.9000

Primera versión con
[`datos_estacion()`](https://maximoortenzi.github.io/estaciones/reference/datos_estacion.md),
[`tabla_resumen_temperatura()`](https://maximoortenzi.github.io/estaciones/reference/tabla_resumen_temperatura.md),
[`grafico_temperatura_mensual()`](https://maximoortenzi.github.io/estaciones/reference/grafico_temperatura_mensual.md)
y los datos `estaciones` y `metadatos`. Sobre esa versión se sumó lo
siguiente.

### Funciones nuevas

- [`promedio_anual_temperatura()`](https://maximoortenzi.github.io/estaciones/reference/promedio_anual_temperatura.md)
  calcula el promedio anual de la temperatura de abrigo a 150 cm de cada
  estación.
- [`precipitacion_acumulada_mensual()`](https://maximoortenzi.github.io/estaciones/reference/precipitacion_acumulada_mensual.md)
  suma la precipitación de cada mes en cada estación y cuenta los días
  con dato.

### Cambios

- [`tabla_resumen_temperatura()`](https://maximoortenzi.github.io/estaciones/reference/tabla_resumen_temperatura.md)
  recibe la variable como texto (entre comillas). Si no se la pasa,
  resume `temperatura_abrigo_150cm`.
- [`grafico_temperatura_mensual()`](https://maximoortenzi.github.io/estaciones/reference/grafico_temperatura_mensual.md)
  elige colores al azar con
  [`colors()`](https://rdrr.io/r/grDevices/colors.html) si no se le
  pasan colores o si hay menos colores que estaciones.
- [`datos_estacion()`](https://maximoortenzi.github.io/estaciones/reference/datos_estacion.md)
  deja que
  [`download.file()`](https://rdrr.io/r/utils/download.file.html) frene
  con su propio error si la estación no existe, y el ejemplo de la
  documentación ahora se ejecuta.
- Los mensajes de error de todas las funciones son más simples y los
  tests revisan el texto de cada mensaje.

### Documentación

- La viñeta muestra cómo unir las estaciones con
  [`rbind()`](https://rdrr.io/r/base/cbind.html) y cómo sumarles la
  ubicación con `left_join()` y `metadatos`.
- El README tiene una bienvenida, una tabla con todas las funciones y
  explica de dónde salen los datos.
- El código que arma los datos del paquete está en `data-raw/`.
- El código de conducta está en español.
