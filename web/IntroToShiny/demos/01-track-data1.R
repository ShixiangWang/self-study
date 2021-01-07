library(shiny)

ui <- fluidPage(
  plotOutput("line") 
)
server <- function(input, output) {
  data <- reactive({read.csv("data.csv")})
  
  output$line <- renderPlot({
    plot(data(), type = "l")
  })
}
shinyApp(ui, server)