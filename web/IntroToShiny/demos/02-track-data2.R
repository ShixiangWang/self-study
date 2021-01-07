library(shiny)

ui <- fluidPage(
  actionButton("go", "Update"),
  plotOutput("line") 
)
server <- function(input, output) {
  data <- eventReactive(input$go, {
    read.csv("data.csv")
  })
  output$line <- renderPlot({
    plot(data(), type = "l")
  })
}
shinyApp(ui, server)