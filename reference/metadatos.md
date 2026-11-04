# Metadatos de las estaciones meteorológicas

Información de 258 estaciones meteorológicas del INTA: ubicación,
coordenadas, altura y período de funcionamiento de cada una. Sirve para
sumarle a los datos diarios la ubicación de cada estación uniendo las
tablas por la columna `id`.

## Usage

``` r
metadatos
```

## Format

Un `tibble` con 258 filas y 11 variables:

- id:

  código de la estación

- nombre:

  nombre de la estación

- tipo:

  tipo de estación

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

  dirección de la estación

- desde:

  fecha desde la que hay registros

- hasta:

  fecha hasta la que hay registros

## Source

Instituto Nacional de Tecnología Agropecuaria (INTA), a través del
Sistema de Información y Gestión Agrometeorológica
([SIGA](https://siga.inta.gob.ar/)). El archivo se descargó del
repositorio del libro:
<https://github.com/rse-r/intro-programacion/blob/main/datos/metadatos_completos.csv>

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

# Ubicación de las cinco estaciones de Santa Fe
dplyr::filter(metadatos, id %in% unique(estaciones$id))
#> # A tibble: 5 × 11
#>   id     nombre     tipo  localidad provincia   lat   lon altura ubicacion desde
#>   <chr>  <chr>      <chr> <chr>     <chr>     <dbl> <dbl>  <dbl> <chr>     <chr>
#> 1 NH0472 INTA - Ol… Conv… Iriondo   Santa Fe  -32.6 -60.8     26 Ruta 11 … 1961…
#> 2 NH0910 Las Rosas… Conv… Las Rosas Santa Fe  -32.5 -61.6      0 Establec… 1975…
#> 3 NH0046 UNR - Zav… Conv… Puan      Santa Fe  -33.0 -60.9     50 xxxxxxxx… 1973…
#> 4 NH0098 INTA - Ra… Conv… Vera      Santa Fe  -31.2 -61.6    100 Ruta 34 … 1956…
#> 5 NH0437 INTA - Re… Conv… Reconqui… Santa Fe  -29.2 -59.7     42 Ruta 11 … 1970…
#> # ℹ 1 more variable: hasta <chr>
```
