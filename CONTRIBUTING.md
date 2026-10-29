# Cómo contribuir a estaciones

Este documento explica cómo proponer cambios en `estaciones`. Para ver
una discusión más detallada sobre cómo contribuir a este y otros
paquetes, podés leer la [guía de contribución de
tidyverse](https://rstd.io/tidy-contrib) y nuestros [principios de
revisión de código](https://code-review.tidyverse.org/).

## Corregir errores de tipeo

Podés corregir errores de tipeo, de ortografía o de gramática en la
documentación directamente desde la interfaz web de GitHub, siempre que
el cambio se haga en el archivo *fuente*. En general esto significa que
tenés que editar los [comentarios de
roxygen2](https://roxygen2.r-lib.org/articles/roxygen2.html) en un
archivo `.R`, y no el archivo `.Rd`. Podés encontrar el archivo `.R` que
genera el `.Rd` leyendo el comentario de la primera línea.

## Cambios más grandes

Si querés hacer un cambio más grande, conviene abrir primero un issue y
asegurarte de que alguien del equipo esté de acuerdo con que hace falta.
Si encontraste un error, abrí un issue que lo muestre con un
[reprex](https://www.tidyverse.org/help/#reprex) mínimo (esto también te
va a ayudar a escribir un test, si hace falta). Podés leer nuestra guía
sobre [cómo escribir un buen
issue](https://code-review.tidyverse.org/issues/) para más consejos.

### Proceso de pull request

- Hacé un fork del paquete y clonalo en tu computadora. Si nunca lo
  hiciste, te recomendamos usar
  `usethis::create_from_github("maximoortenzi/estaciones", fork = TRUE)`.

- Instalá todas las dependencias de desarrollo con
  `devtools::install_dev_deps()` y después fijate que el paquete pase el
  `R CMD check` corriendo `devtools::check()`. Si el check no pasa
  limpio, conviene pedir ayuda antes de seguir.

- Creá una rama de Git para tu pull request (PR). Te recomendamos usar
  `usethis::pr_init("breve-descripcion-del-cambio")`.

- Hacé tus cambios, commiteá y después creá el PR corriendo
  `usethis::pr_push()` y siguiendo las instrucciones del navegador. El
  título del PR tiene que describir brevemente el cambio. El cuerpo del
  PR tiene que incluir `Fixes #numero-de-issue`.

- Para los cambios que se ven desde afuera, agregá un punto arriba de
  todo en `NEWS.md` (justo debajo del primer encabezado). Seguí el
  estilo descrito en <https://style.tidyverse.org/news.html>.

### Estilo del código

- El código nuevo tiene que seguir la [guía de
  estilo](https://style.tidyverse.org) de tidyverse. Podés usar
  [Air](https://posit-dev.github.io/air/) para aplicarla, pero por favor
  no reescribas código que no tenga nada que ver con tu PR.

- Usamos [roxygen2](https://cran.r-project.org/package=roxygen2), con
  [sintaxis
  Markdown](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html),
  para la documentación.

- Usamos [testthat](https://cran.r-project.org/package=testthat) para
  los tests. Las contribuciones que incluyen tests son más fáciles de
  aceptar.

## Código de conducta

Tené en cuenta que el proyecto `estaciones` se publica con un [Código de
Conducta para
Contribuyentes](https://maximoortenzi.github.io/estaciones/CODE_OF_CONDUCT.md).
Al contribuir con este proyecto aceptás respetar sus términos.
