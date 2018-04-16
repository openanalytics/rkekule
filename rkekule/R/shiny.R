# Shiny integration
# 
# Author: Daan Seynaeve <daan.seynaeve@openanalytics.eu>
###############################################################################

#' Helper functions for using chemViewer in Shiny
#' @rdname rkekuleOutput
#' @description \code{rkekuleOutput}: create a container for the widget
#' @param outputId output variable to read the widget from
#' @param the width of the widget container
#' @param the height of the table container
#' @export
rkekuleOutput <- function(outputId, width = "100%", height = "400px") {
  shinyWidgetOutput(outputId, "rkekule", width, height, package = "rkekule")
}

#' @rdname rkekuleOutput
#' @description \code{renderRkekule}: server logic to render the widget
#' @param expr output of \code{\link{chemViewer}}
#' @param env The environment in which to evaluate expr.
#' @param quoted Is expr a quoted expression (with \code{quote()})?
#' This is useful if you want to save an expression in a variable.
#' @export
renderRkekule <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, rkekuleOutput, env, quoted = TRUE)
}


