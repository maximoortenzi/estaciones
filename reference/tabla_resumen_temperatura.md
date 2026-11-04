# Tabla resumen de temperatura

Calcula la media y el desvío estándar de una variable de temperatura
para cada estación y devuelve una tabla con una fila por estadístico y
una columna por estación. Sirve tanto para una como para varias
estaciones.

## Usage

``` r
tabla_resumen_temperatura(datos, variable = "temperatura_abrigo_150cm")
```

## Arguments

- datos:

  Un `data.frame` o `tibble` con los datos de una o más estaciones.
  Tiene que tener la columna `id` y la variable que se quiere resumir.

- variable:

  Nombre de la variable de temperatura que se quiere resumir. Se puede
  pasar sin comillas (`temperatura_abrigo_150cm`) o como texto
  (`"temperatura_abrigo_150cm"`). Por defecto es
  `temperatura_abrigo_150cm`.

## Value

Un `tibble` con dos filas (`media` y `desvio`) y una columna por
estación.

## Examples

``` r
tabla_resumen_temperatura(estaciones)
#> # A tibble: 2 × 6
#>   variable NH0046 NH0098 NH0437 NH0472 NH0910
#>   <chr>     <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#> 1 media     17.3   18.6   20.2   18.0   17.7 
#> 2 desvio     5.90   5.98   5.77   5.94   6.12

tabla_resumen_temperatura(estaciones, temperatura_abrigo_150cm_minima)
#> # A tibble: 2 × 6
#>   variable NH0046 NH0098 NH0437 NH0472 NH0910
#>   <chr>     <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#> 1 media     11.2   12.1   14.6   12.1   10.9 
#> 2 desvio     6.19   6.09   6.02   6.28   6.30

# También se puede pasar como texto
tabla_resumen_temperatura(estaciones, "temperatura_abrigo_150cm_minima")
#> # A tibble: 2 × 6
#>   variable NH0046 NH0098 NH0437 NH0472 NH0910
#>   <chr>     <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
#> 1 media     11.2   12.1   14.6   12.1   10.9 
#> 2 desvio     6.19   6.09   6.02   6.28   6.30
```
