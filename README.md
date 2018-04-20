# rkekule

`rkekule` is an R wrapper of the JavaScript library [Kekule.js](http://partridgejiang.github.io/Kekule.js/)

## Installation

To install the package from GitHub, you can use package `remotes`

```r
# install.packages("remotes")
remotes::install_github("openanalytics/rkekule", subdir = "rkekule")
```

To get a package overview, run

```r
library(rkekule)
?rkekule
```

## chemViewer widget

Supported formats:

* MDL MOL / moltable
* CML


```r
# example with CML

library(rkekule)

cml <- paste0(
    '<cml xmlns="http://www.xml-cml.org/schema">',
    '<molecule id="m1"><atomArray>',
      '<atom id="a2" elementType="C" x2="7.493264658965051" y2="35.58088907877604"/>',
      '<atom id="a3" elementType="O" x2="8.186084981992602" y2="35.18088907877604"/>',
      '<atom id="a1" elementType="C" x2="6.800444335937501" y2="35.18088907877604"/>',
    '</atomArray><bondArray>',
      '<bond id="b2" order="S" atomRefs2="a2 a3"/>',
      '<bond id="b1" order="S" atomRefs2="a2 a1"/>',
    '</bondArray></molecule></cml>')

widget <- chemViewer(cml, width = 400, height = 200, chemicalFormat = "cml", renderType = "2D")

widget
```

## Shiny integration

To render chemical structures in a Shiny app, you can use

* `renderRkekule` in your server code
* `rkekuleOutput` in your ui code

See [examples/exampleShiny.R](examples/exampleShiny.R) for an example.

## DT integration

See [examples/exampleDT.R](examples/exampleDT.R) for an example.

## Roadmap

* simplify DT integration boilerplate
* optional support for other formats such as SMILES and InCHI via [ChemmineOB](https://www.bioconductor.org/packages/release/bioc/html/ChemmineOB.html)
* RMarkdown support
* plotly hover support
* support for other Kekule.js widgets:
  * Kekule.ChemWidget.PeriodicTable 
  * Kekule.Editor.Composer
