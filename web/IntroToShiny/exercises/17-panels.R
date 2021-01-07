ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "num", 
        label = "Choose a number", 
        val = 25, min = 1, max = 100)
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)


server <- function(input, output) {
  data <- reactive({rnorm(input$num)})
  output$hist <- renderPlot({
    hist(data())   
  })
  output$sum <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)