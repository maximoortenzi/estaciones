# Datos meteorologicos de cinco estaciones de Santa Fe

Observaciones diarias de cinco estaciones meteorologicas del INTA de la
provincia de Santa Fe: Oliveros (NH0472), Las Rosas (NH0910), Zavalla
(NH0046), Rafaela (NH0098) y Reconquista (NH0437). Los datos cubren el
periodo entre 1956 y 2023.

## Usage

``` r
estaciones
```

## Format

Un `tibble` con 95681 filas y 35 variables:

- id:

  codigo de la estacion

- fecha:

  fecha de la observacion

- temperatura_abrigo_150cm:

  temperatura de abrigo a 150 cm (grados Celsius)

- temperatura_abrigo_150cm_maxima:

  temperatura maxima de abrigo a 150 cm

- temperatura_abrigo_150cm_minima:

  temperatura minima de abrigo a 150 cm

- temperatura_intemperie_5cm_minima:

  temperatura minima a la intemperie a 5 cm

- temperatura_intemperie_50cm_minima:

  temperatura minima a la intemperie a 50 cm

- temperatura_suelo_5cm_media:

  temperatura media del suelo a 5 cm

- temperatura_suelo_10cm_media:

  temperatura media del suelo a 10 cm

- temperatura_inte_5cm:

  temperatura a la intemperie a 5 cm

- temperatura_intemperie_150cm_minima:

  temperatura minima a la intemperie a 150 cm

- humedad_suelo:

  humedad del suelo

- precipitacion_pluviometrica:

  precipitacion (milimetros)

- granizo:

  registro de granizo

- nieve:

  registro de nieve

- heliofania_efectiva:

  horas de sol efectivas

- heliofania_relativa:

  horas de sol relativas

- tesion_vapor_media:

  tension de vapor media (el nombre es el del archivo original)

- humedad_media:

  humedad media

- humedad_media_8_14_20:

  humedad media de las 8, 14 y 20 horas

- rocio_medio:

  punto de rocio medio

- duracion_follaje_mojado:

  duracion del follaje mojado

- velocidad_viento_200cm_media:

  velocidad media del viento a 200 cm

- direccion_viento_200cm:

  direccion del viento a 200 cm

- velocidad_viento_1000cm_media:

  velocidad media del viento a 1000 cm

- direccion_viento_1000cm:

  direccion del viento a 1000 cm

- velocidad_viento_maxima:

  velocidad maxima del viento

- presion_media:

  presion atmosferica media

- radiacion_global:

  radiacion global

- radiacion_neta:

  radiacion neta

- evaporacion_tanque:

  evaporacion del tanque

- evapotranspiracion_potencial:

  evapotranspiracion potencial

- profundidad_napa:

  profundidad de la napa

- horas_frio:

  horas de frio acumuladas

- unidad_frio:

  unidades de frio acumuladas

## Source

<https://github.com/rse-r/intro-programacion/tree/main/datos>

## Details

Algunas columnas quedaron como `logical` con todos sus valores perdidos
(`NA`) porque no tienen datos para estas estaciones en el archivo
original. Es esperable y no es un error del paquete.

## Examples

``` r
estaciones
#> # A tibble: 95,681 × 35
#>    id     fecha      temperatura_abrigo_150cm temperatura_abrigo_150cm_maxima
#>    <chr>  <date>                        <dbl>                           <dbl>
#>  1 NH0472 1961-07-01                     11.1                            13.4
#>  2 NH0472 1961-07-02                      5.5                            10.5
#>  3 NH0472 1961-07-03                      6                              10.8
#>  4 NH0472 1961-07-04                     NA                              NA  
#>  5 NH0472 1961-07-05                     12.4                            14.8
#>  6 NH0472 1961-07-06                     11                              16.5
#>  7 NH0472 1961-07-07                      7                              10  
#>  8 NH0472 1961-07-08                      5.6                            10  
#>  9 NH0472 1961-07-09                     NA                              NA  
#> 10 NH0472 1961-07-10                      8.4                            12.1
#> # ℹ 95,671 more rows
#> # ℹ 31 more variables: temperatura_abrigo_150cm_minima <dbl>,
#> #   temperatura_intemperie_5cm_minima <dbl>,
#> #   temperatura_intemperie_50cm_minima <dbl>,
#> #   temperatura_suelo_5cm_media <dbl>, temperatura_suelo_10cm_media <dbl>,
#> #   temperatura_inte_5cm <lgl>, temperatura_intemperie_150cm_minima <lgl>,
#> #   humedad_suelo <lgl>, precipitacion_pluviometrica <dbl>, granizo <dbl>, …
```
