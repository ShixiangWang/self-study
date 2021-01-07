library(shiny)

ui <- htmlTemplate("index.html",
  slider = sliderInput("num", "Choose a number", 1, 100, 50),
  plot = plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num), col = "red2", bor = "white", breaks = 30)   
  })
}

shinyApp(ui = ui, server = server)