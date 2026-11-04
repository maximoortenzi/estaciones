# Gráfico de temperatura mensual

Calcula el promedio mensual de la temperatura de abrigo a 150 cm de cada
estación y devuelve un gráfico de líneas con una línea por estación.
Sirve tanto para una como para varias estaciones.

## Usage

``` r
grafico_temperatura_mensual(datos, colores = NULL, titulo = "Temperatura")
```

## Arguments

- datos:

  Un `data.frame` o `tibble` con los datos de una o más estaciones.
  Tiene que tener las columnas `id`, `fecha` y
  `temperatura_abrigo_150cm`.

- colores:

  Vector de colores (texto), uno por estación. Por ejemplo
  `c("darkorange", "purple", "cyan4", "steelblue", "pink3")`. Es
  opcional: si no se pasa, o si tiene menos colores que estaciones, se
  eligen colores al azar con
  [`colors()`](https://rdrr.io/r/grDevices/colors.html).

- titulo:

  Título del gráfico. Por defecto es `"Temperatura"`.

## Value

Un objeto `ggplot` con el ciclo anual de temperatura.

## Examples

``` r
grafico_temperatura_mensual(
  estaciones,
  colores = c("darkorange", "purple", "cyan4", "steelblue", "pink3"),
  titulo = "Ciclo anual de temperatura"
)


# Sin colores: se eligen al azar
grafico_temperatura_mensual(estaciones)
#> ℹ No había un color por estación, así que se eligieron al azar.

```
