# Chem Viewer Widget
# 
# Author: Daan Seynaeve <daan.seynaeve@openanalytics.eu>
###############################################################################

#' Chem Viewer Widget
#' @description Create a widget to view chemical structure data in 2D or 3D.
#' Basic interactions like zooming and rotation are supported.
#' @param data moltable or cml
#' @param width widget width
#' @param height widget height
#' @param chemicalFormat one of \code{c("mol", "cml"}
#' @param renderType one of \code{c("2D", "3D")}
#' @param showTools show toolbar.
#' @return htmlwidget
#' @details Limitations: The current version only supports moltables and cml.
#' @importFrom htmlwidgets createWidget
#' @export
chemViewer <- function(
    data,
    width = NULL,
    height = NULL,
    chemicalFormat = c("mol", "cml"),
    renderType = c("2D", "3D"),
    showTools = TRUE) {
  
  chemicalFormat <- match.arg(chemicalFormat, c("mol", "cml"))
  
  renderType <- match.arg(renderType, c("2D", "3D"))
  
  settings <- list(
      type = chemicalFormat,
      renderType = renderType,
      showTools = FALSE)
  
  x <- list(
      data = data,
      settings = settings)
  
  createWidget("rkekule", x, width = width, height = height)
  
}