# Shiny integration
# 
# Author: Daan Seynaeve <daan.seynaeve@openanalytics.eu>
###############################################################################

#' Widget Output Function For Use In Shiny
#' @export
rkekuleOutput <- function(outputId, width = "100%", height = "400px") {
  shinyWidgetOutput(outputId, "rkekule", width, height, package = "rkekule")
}

#' Widget render function for use in Shiny
#' @export
renderRkekule <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, rkekuleOutput, env, quoted = TRUE)
}


