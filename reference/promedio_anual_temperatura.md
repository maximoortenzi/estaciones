# Promedio anual de temperatura

Calcula el promedio de la temperatura de abrigo a 150 cm para cada
estación y cada año. Sirve para ver si la temperatura media cambia con
el tiempo.

## Usage

``` r
promedio_anual_temperatura(datos)
```

## Arguments

- datos:

  Un `data.frame` o `tibble` con los datos de una o más estaciones.
  Tiene que tener las columnas `id`, `fecha` y
  `temperatura_abrigo_150cm`.

## Value

Un `tibble` con una fila por estación y año, y las columnas `id`, `anio`
y `temperatura_media` (en grados Celsius).

## Details

Si una estación no tiene ningún dato de temperatura en un año, el
promedio de ese año es `NaN`.

## Examples

``` r
promedio_anual_temperatura(estaciones)
#> # A tibble: 272 × 3
#>    id      anio temperatura_media
#>    <chr>  <dbl>             <dbl>
#>  1 NH0046  1973              16.5
#>  2 NH0046  1974              16.8
#>  3 NH0046  1975              16.8
#>  4 NH0046  1976              16.3
#>  5 NH0046  1977              17.1
#>  6 NH0046  1978              16.6
#>  7 NH0046  1979              16.7
#>  8 NH0046  1980              17.3
#>  9 NH0046  1981              17.3
#> 10 NH0046  1982              17.3
#> # ℹ 262 more rows

# Solo para Reconquista
estaciones |>
  dplyr::filter(id == "NH0437") |>
  promedio_anual_temperatura()
#> # A tibble: 54 × 3
#>    id      anio temperatura_media
#>    <chr>  <dbl>             <dbl>
#>  1 NH0437  1970              19.5
#>  2 NH0437  1971              19.6
#>  3 NH0437  1972              19.7
#>  4 NH0437  1973              19.2
#>  5 NH0437  1974              19.4
#>  6 NH0437  1975              19.8
#>  7 NH0437  1976              19.4
#>  8 NH0437  1977              20.3
#>  9 NH0437  1978              19.8
#> 10 NH0437  1979              19.6
#> # ℹ 44 more rows
```
