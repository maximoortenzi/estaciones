# Precipitación acumulada mensual

Suma la precipitación de cada mes para cada estación. El mes se obtiene
con
[`lubridate::floor_date()`](https://lubridate.tidyverse.org/reference/round_date.html),
así que cada mes de cada año es un grupo distinto.

## Usage

``` r
precipitacion_acumulada_mensual(datos)
```

## Arguments

- datos:

  Un `data.frame` o `tibble` con los datos de una o más estaciones.
  Tiene que tener las columnas `id`, `fecha` y
  `precipitacion_pluviometrica`.

## Value

Un `tibble` con una fila por estación y mes, y las columnas `id`, `mes`
(el primer día del mes), `precipitacion_acumulada` (en milímetros) y
`dias_con_dato`.

## Details

Los días sin dato (`NA`) no se cuentan en la suma. Por eso la tabla trae
también la cantidad de días con dato: un mes sin ningún dato da una
precipitación de 0 pero con `dias_con_dato` igual a 0, y no hay que
confundirlo con un mes sin lluvia.

## Examples

``` r
precipitacion_acumulada_mensual(estaciones)
#> # A tibble: 3,151 × 4
#>    id     mes        precipitacion_acumulada dias_con_dato
#>    <chr>  <date>                       <dbl>         <int>
#>  1 NH0046 1973-01-01                    90.4            31
#>  2 NH0046 1973-02-01                   204.             28
#>  3 NH0046 1973-03-01                   197.             31
#>  4 NH0046 1973-04-01                    99.2            30
#>  5 NH0046 1973-05-01                     4.4            31
#>  6 NH0046 1973-06-01                   160              30
#>  7 NH0046 1973-07-01                    68.6            31
#>  8 NH0046 1973-08-01                     4              31
#>  9 NH0046 1973-09-01                     9              30
#> 10 NH0046 1973-10-01                   128.             31
#> # ℹ 3,141 more rows

# Solo para Oliveros
estaciones |>
  dplyr::filter(id == "NH0472") |>
  precipitacion_acumulada_mensual()
#> # A tibble: 672 × 4
#>    id     mes        precipitacion_acumulada dias_con_dato
#>    <chr>  <date>                       <dbl>         <int>
#>  1 NH0472 1961-07-01                    38              31
#>  2 NH0472 1961-08-01                    23              31
#>  3 NH0472 1961-09-01                    48.4            30
#>  4 NH0472 1961-10-01                    90.2            31
#>  5 NH0472 1961-11-01                   122              30
#>  6 NH0472 1961-12-01                   124.             31
#>  7 NH0472 1962-01-01                    58.7            31
#>  8 NH0472 1962-02-01                    39.7            28
#>  9 NH0472 1962-03-01                   214.             31
#> 10 NH0472 1962-04-01                    64.7            30
#> # ℹ 662 more rows
```
