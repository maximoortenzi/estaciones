# Descarga y lee los datos de una estación

Descarga el archivo `CSV` de una estación meteorológica del INTA y lo
lee como un `tibble`. Si el archivo ya existe en la ruta indicada no lo
vuelve a descargar, solo lo lee. Sirve para cualquier estación que tenga
su archivo en el repositorio del libro: solo hay que pasarle su
identificador. Hoy el repositorio tiene las cinco estaciones de Santa Fe
que trae el paquete en
[estaciones](https://maximoortenzi.github.io/estaciones/reference/estaciones.md).

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
# En tu proyecto usarías una ruta como "datos/NH0910.csv". Acá guardamos el
# archivo en una carpeta temporal para no dejar archivos sueltos.
ruta <- file.path(tempdir(), "NH0910.csv")

las_rosas <- datos_estacion("NH0910", ruta)
#> ✔ Se descargó la estación NH0910 en /tmp/Rtmp385EzH/NH0910.csv
#> ✔ Leyendo los datos
las_rosas
#> # A tibble: 15,553 × 35
#>    id     fecha      temperatura_abrigo_150cm temperatura_abrigo_150cm_maxima
#>    <chr>  <date>                        <dbl>                           <dbl>
#>  1 NH0910 1975-01-01                     21                              31  
#>  2 NH0910 1975-01-02                     21.2                            28.5
#>  3 NH0910 1975-01-03                     24.2                            32.5
#>  4 NH0910 1975-01-04                     23.5                            31  
#>  5 NH0910 1975-01-05                     19                              22  
#>  6 NH0910 1975-01-06                     22.2                            27.5
#>  7 NH0910 1975-01-07                     24.2                            30  
#>  8 NH0910 1975-01-08                     26.5                            33.5
#>  9 NH0910 1975-01-09                     26.5                            35  
#> 10 NH0910 1975-01-10                     19.2                            25  
#> # ℹ 15,543 more rows
#> # ℹ 31 more variables: temperatura_abrigo_150cm_minima <dbl>,
#> #   temperatura_intemperie_5cm_minima <lgl>,
#> #   temperatura_intemperie_50cm_minima <lgl>,
#> #   temperatura_suelo_5cm_media <lgl>, temperatura_suelo_10cm_media <lgl>,
#> #   temperatura_inte_5cm <lgl>, temperatura_intemperie_150cm_minima <lgl>,
#> #   humedad_suelo <lgl>, precipitacion_pluviometrica <dbl>, granizo <lgl>, …
```
