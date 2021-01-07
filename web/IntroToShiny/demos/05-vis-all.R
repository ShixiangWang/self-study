library(shiny)
library(ggplot2)

ui <- fluidPage(
  plotOutput("plot", 
             click = "click",
             dblclick = "dblclick",
             hover = "hover",
             brush = "brush"),
  selectInput("xVar", "Select X", 
    choices = names(mtcars), selected = "wt"),
fluidRow(
    column(3, 
      h4("Click"),
      verbatimTextOutput("clickVals")
    ),
    column(3, 
      h4("Double Click"),
      verbatimTextOutput("dblclickVals")
    ),
    column(3, 
      h4("Hover"),
      verbatimTextOutput("hoverVals")
    ),
    column(3, 
      h4("Brush"),
      verbatimTextOutput("brushVals")
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot({
    qplot(mtcars[[input$xVar]], mtcars$mpg, 
          xlab = input$xVar, ylab = "mpg", data = mtcars)
  })
  
  output$clickVals <- renderText({
    paste0("x=", input$click$x, "\ny=", input$click$y)
  })
  
  output$dblclickVals <- renderText({
    paste0("x=", input$dblclick$x, "\ny=", input$dblclick$y)
  })
  
  output$hoverVals <- renderText({
    paste0("x=", input$hover$x, "\ny=", input$hover$y)
  })
  
  output$brushVals <- renderText({
    paste0("xmin=", input$brush$xmin, "\nymin=", input$brush$ymin, "\nxmax=", input$brush$xmax,"\nymax=", input$brush$ymax)
  })
  
}

shinyApp(ui, server)

