# DataTable (DT) integration
# 
# Author: Daan Seynaeve <daan.seynaeve@openanalytics.eu>
###############################################################################

#' Provides a html wrapper for a table column with chemical structure data.
#' @description Return an expression to use in the \code{options$coldefs}
#' argument of \link[DT]{datatable}.
#' @param targets vector of zero-based indices of columns that need to be rendered
#' @param useTooltip only show the structure upon hovering
#' @export
rkekuleColumnDefs <- function(targets, useTooltip = TRUE) {
  prefix <- "<span class=\"rkekule-wrapper\">"
  suffix <- "</span>"
  
  if (useTooltip) {
    prefix <- paste0("<div class=\"rkekule-tooltip\">",
        "show ", "<i class=\"fa fa-search-plus\"></i>",
        "<span class=\"rkekule-tooltiptext\">",
          prefix)
    suffix <- paste0(suffix,"</span></div>")
  }
  
  list(
      targets = targets,
      render = JS(paste0("function(data, type, full){ return '", prefix, "' + data + '", suffix, "' }"))
  )
}

#' Provides a javascript call to draw the html-wrapper structures
#' @description Returns an expression to use in the \code{options$fnDrawCallback}
#' argument of \code{\link[DT]{datatable}}.
#' @param settings kekule rendering settings
#' @return HTML script tag
#' @export
rkekuleFnDrawCallback <- function(settings = "type: 'mol', width: 100, height: 100") {
  js <- paste0("function (oSettings, json) { $('.rkekule-wrapper').rkekule({ ",
			settings, " }); }", collapse = "")
	JS(js)
}

#' Explicitly Include The HTML Dependencies
#' @description Attaches the rkekule dependencies to a HTML tag or widget.
#' @param x object (tag) to attach the dependencies to. Default to an empty div
#' @return HTML empty div tag with rkekule dependencies attached
#' @importFrom htmlwidgets getDependency
#' @importFrom htmltools attachDependencies
#' @export
attachRkekuleDependencies <- function(x = div()) {
	attachDependencies(x, getDependency("rkekule", "rkekule"))
}
