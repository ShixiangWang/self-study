library(shiny)

ui <- fluidPage(
  verbatimTextOutput("time")
)

server <- function(input, output) {
  
  output$time <- renderPrint({
    invalidateLater(1000) 
    Sys.time()
  })
}

shinyApp(ui = ui, server = server)