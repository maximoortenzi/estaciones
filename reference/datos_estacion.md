# Descarga y lee los datos de una estación

Descarga el archivo `CSV` de una estación meteorológica del INTA y lo
lee como un `tibble`. Si el archivo ya existe en la ruta indicada no lo
vuelve a descargar, solo lo lee. Sirve para cualquier estación: solo hay
que pasarle su identificador.

## Usage

``` r
datos_estacion(id, ruta_archivo)
```

## Arguments

- id:

  Código de la estación, por ejemplo `"NH0437"`.

- ruta_archivo:

  Ruta donde se guarda (o donde ya está) el archivo, por ejemplo
  `"datos/NH0437.csv"`. Si la carpeta no existe, se crea.

## Value

Un `tibble` con una fila por fecha y una columna por variable
meteorológica.

## Examples

``` r
estacion_NH0437 <- datos_estacion("NH0437", "datos/NH0437.csv")
#> ✔ Se descargó la estación NH0437 en datos/NH0437.csv
#> ✔ Leyendo los datos
#> Warning: One or more parsing issues, call `problems()` on your data frame for details,
#> e.g.:
#>   dat <- vroom(...)
#>   problems(dat)
estacion_NH0437
#> # A tibble: 18,929 × 35
#>    id     fecha      temperatura_abrigo_150cm temperatura_abrigo_150cm_maxima
#>    <chr>  <date>                        <dbl>                           <dbl>
#>  1 NH0437 1970-08-01                    23.3                             31.2
#>  2 NH0437 1970-08-02                    26.6                             32.1
#>  3 NH0437 1970-08-03                    17.4                             22.9
#>  4 NH0437 1970-08-04                    11.0                             11.9
#>  5 NH0437 1970-08-05                    11.1                             12.6
#>  6 NH0437 1970-08-06                    13.6                             15.1
#>  7 NH0437 1970-08-07                    10.8                             14.9
#>  8 NH0437 1970-08-08                     7.75                            13.7
#>  9 NH0437 1970-08-09                     8.2                             15.1
#> 10 NH0437 1970-08-10                    10.2                             18.4
#> # ℹ 18,919 more rows
#> # ℹ 31 more variables: temperatura_abrigo_150cm_minima <dbl>,
#> #   temperatura_intemperie_5cm_minima <dbl>,
#> #   temperatura_intemperie_50cm_minima <dbl>,
#> #   temperatura_suelo_5cm_media <dbl>, temperatura_suelo_10cm_media <lgl>,
#> #   temperatura_inte_5cm <lgl>, temperatura_intemperie_150cm_minima <lgl>,
#> #   humedad_suelo <lgl>, precipitacion_pluviometrica <dbl>, granizo <dbl>, …
```
