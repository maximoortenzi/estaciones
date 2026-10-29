# Descarga y lee los datos de una estacion

Descarga el archivo `CSV` de una estacion meteorologica del INTA y lo
lee como un `tibble`. Si el archivo ya existe en la ruta indicada no lo
vuelve a descargar, solo lo lee. Sirve para cualquier estacion: solo hay
que pasarle su identificador.

## Usage

``` r
datos_estacion(id, ruta_archivo)
```

## Arguments

- id:

  Codigo de la estacion, por ejemplo `"NH0437"`.

- ruta_archivo:

  Ruta donde se guarda (o donde ya esta) el archivo, por ejemplo
  `"datos/NH0437.csv"`.

## Value

Un `tibble` con una fila por fecha y una columna por variable
meteorologica.

## Examples

``` r
if (FALSE) { # \dontrun{
estacion_NH0437 <- datos_estacion("NH0437", "datos/NH0437.csv")
estacion_NH0437
} # }
```
