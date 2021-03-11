library(shiny)

ui = fluidPage(
  selectInput("dataset", label = "Dataset",
              choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)


server <- function(input, output, session) {
  # reactive is a new approach
  # variable or function cannot work here
  dataset <- reactive({
    get(input$dataset, "package:datasets", inherits = FALSE)
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  
  output$table <- renderTable({
    dataset()
  })
}

shinyApp(ui, server)
