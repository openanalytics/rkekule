# Create a widget that is initialized with data via html binding
# 
# Author: Daan Seynaeve <daan.seynaeve@openanalytics.eu>
###############################################################################

#' Create a Kekule.js HTML binding with inline data definition.
#' @description Generate a string of HTML code with the structure data included
#' inline that will be initialized by HTML binding. This is useful in an embedded
#' setting where the structure data is available in the context where the UI
#' is constructed. E.g. when inside renderUI in shiny.
#' @param dataChemObj the data
#' @param id avoid clashes between multiple bindings
#' @param width widget width
#' @param height widget height
#' @return \code{character()} vector of length 1
#' @references
#' https://partridgejiang.github.io/Kekule.js/documents/tutorial/content/chemViewer.html#creating-viewer
#' @export
rkekuleHtmlBinding <- function(dataChemObj, id, width = 500, height = 400) {
  id <- paste0("rkekule-bind-", id)
  paste0(
      '<script id="', id, '" type="chemical/x-mdl-molfile">',
        dataChemObj,
      '</script>\n',
      '<div id="chemViewer"',' ',
        'style="width:',width,';height:',height,'"',' ',
        'data-widget="Kekule.ChemWidget.Viewer"', ' ',
        'data-chem-obj="url(#', id, ')">',
      '</div>'
      )
}