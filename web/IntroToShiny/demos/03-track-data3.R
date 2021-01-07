library(shiny)

ui <- fluidPage(
  plotOutput("line") 
)
server <- function(input, output) {
  data <- reactive({
    invalidateLater(5000)
    read.csv("data.csv")
  })
  output$line <- renderPlot({
    plot(data(), type = "l")
  })
}
shinyApp(ui, server)