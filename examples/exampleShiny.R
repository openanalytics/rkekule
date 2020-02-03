# Example usage of the rkekule package with Shiny
# 
# Author: Daan Seynaeve
###############################################################################

library(shiny)
library(rkekule)

mol <- readMolfile(system.file("extdata", "example1.mol", package = "rkekule"))

ui <- function(request) {
  
  fluidPage(
      fluidRow(
          column(12,
              h3("Reactive Shiny widget"),
              p("The rkekuleOuput and renderRkekule functions allow reactive rerendering of the chemical structure"),
              rkekuleOutput("viewer", width = "400px", height = "200px")
          )
      )
  )
  
}

server <- function(input, output, session) {
  
  output$viewer <- renderRkekule({
        
        chemViewer(mol, chemicalFormat = "mol", renderType = "2D")
        
      })
  
}

shinyApp(ui = ui, server = server)
