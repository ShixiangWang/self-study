library(shiny)
library(ggplot2)
diamonds2 <- diamonds[sample(1:nrow(diamonds), 5000), ]

ui <- fluidPage(
  plotOutput("plot1", brush = "brush"),
  plotOutput("plot2")
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(diamonds2, aes(x = cut, y = color)) +
      geom_count() +
      theme_bw()
  })
  
  output$plot2 <- renderPlot({
    ggplot(diamonds2, aes(carat, price)) +
      geom_point() +
      theme_bw() +
      geom_point(color = "green",
        data = brushedPoints(diamonds2, input$brush))
  })
}

shinyApp(ui, server)