# Grafico de temperatura mensual

Calcula el promedio mensual de la temperatura de abrigo a 150 cm de cada
estacion y devuelve un grafico de lineas con una linea por estacion.
Sirve tanto para una como para varias estaciones.

## Usage

``` r
grafico_temperatura_mensual(datos, colores, titulo = "Temperatura")
```

## Arguments

- datos:

  Un `data.frame` o `tibble` con los datos de una o mas estaciones.
  Tiene que tener las columnas `id`, `fecha` y
  `temperatura_abrigo_150cm`.

- colores:

  Vector de colores, uno por estacion. Por ejemplo
  `c("darkorange", "purple", "cyan4", "steelblue", "pink3")`.

- titulo:

  Titulo del grafico. Por defecto es `"Temperatura"`.

## Value

Un objeto `ggplot` con el ciclo anual de temperatura.

## Examples

``` r
grafico_temperatura_mensual(
  estaciones,
  colores = c("darkorange", "purple", "cyan4", "steelblue", "pink3"),
  titulo = "Ciclo anual de temperatura"
)

```
