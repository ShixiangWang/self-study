library(shiny)

ui <- fluidPage(
  plotOutput("line") 
)

server <- function(input, output, session) {
  data <- reactiveFileReader(
    intervalMillis = 5000, 
    session = session,
    filePath = "data.csv"
    readFunc = read.csv)
  })

  output$line <- renderPlot({
    plot(data(), type = "l")
  })
}

shinyApp(ui, server)