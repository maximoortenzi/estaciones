# Metadatos de las estaciones meteorologicas

Informacion de las 258 estaciones meteorologicas disponibles en el
repositorio del libro: ubicacion, coordenadas, altura y periodo de
funcionamiento de cada una.

## Usage

``` r
metadatos
```

## Format

Un `tibble` con 258 filas y 11 variables:

- id:

  codigo de la estacion

- nombre:

  nombre de la estacion

- tipo:

  tipo de estacion

- localidad:

  localidad donde se encuentra

- provincia:

  provincia donde se encuentra

- lat:

  latitud

- lon:

  longitud

- altura:

  altura sobre el nivel del mar (metros)

- ubicacion:

  direccion de la estacion

- desde:

  fecha desde la que hay registros

- hasta:

  fecha hasta la que hay registros

## Source

<https://github.com/rse-r/intro-programacion/tree/main/datos>

## Examples

``` r
metadatos
#> # A tibble: 258 × 11
#>    id      nombre   tipo  localidad provincia   lat   lon altura ubicacion desde
#>    <chr>   <chr>    <chr> <chr>     <chr>     <dbl> <dbl>  <dbl> <chr>     <chr>
#>  1 A872999 Institu… Nimb… Hurlingh… Buenos A… -90     0      22  Jardin B… 2000…
#>  2 A872834 Lima - … Nimb… Lima      Buenos A… -34.1 -59.2    28  Ruta 9 -… 2010…
#>  3 A872823 Anguil … Nimb… Anguil    La Pampa  -36.5 -64.0   165  Ruta Nac… 2010…
#>  4 A872822 Huinca … Nimb… Huinca R… Córdoba   -34.8 -64.4   189  Ruta Nac… 2010…
#>  5 A872821 Gral Sa… Nimb… General … La Pampa  -38   -63.5   178. Ruta Nac… 2010…
#>  6 A872819 Miramar… Nimb… Miramar   Buenos A… -38.2 -58.0    12  Ruta Nº … 2010…
#>  7 A872808 La Dulc… Nimb… Necochea  Buenos A… -38.3 -59.0    72  Ruta Pro… 2010…
#>  8 A872816 Coronel… Nimb… Coronel … Buenos A… -37.3 -62.0   237  Ruta 85,… 2010…
#>  9 A872825 Tornqui… Nimb… Tornquist Buenos A… -38.1 -62.2   280  Acc. Tor… 2010…
#> 10 A872812 Sachayo… Nimb… Sachayoj  Santiago… -26.5 -61.8   197  -         2010…
#> # ℹ 248 more rows
#> # ℹ 1 more variable: hasta <chr>
```
