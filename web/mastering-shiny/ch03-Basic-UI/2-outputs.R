# Like inputs, outputs take a unique ID as their first argument
# If your UI specification creates an output with ID "plot",
# you’ll access it in the server function with output$plot. 

# Three maintypes of output:
# text, tables, and plots

# Use *Output function in UI
# and use render* function in server


# Text --------------------------------------------------------------------

ui = fluidPage(
  # For regular text
  textOutput("text"),
  # For code
  verbatimTextOutput("code")
)

server = function(input, output, session) {
  # displays text returned by the code
  output$text = renderText("Hello my friend!")
  # displays text printed by the code
  output$code = renderPrint(summary(1:10))
}

shinyApp(ui, server)



# Tables ------------------------------------------------------------------

# Two options:
# 1. tableOutput() and renderTable(): render a static table of data, showing all the data at once.
# 2. dataTableOutput() and renderDataTable(): render a dynamic table, where only a fixed number of rows are shown at once, and the user can interact to see more.
#
# The option #1 is most useful for small, fixed summaries
# The option #2 is most appropriate for exposing a complete data frame

ui = fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic")
)

server = function(input, output, session) {
  output$static = renderTable(head(mtcars))
  output$dynamic = renderDataTable(mtcars, options = list(pageLength=5))
}

shinyApp(ui, server)



# Plots -------------------------------------------------------------------

ui = fluidPage(
  plotOutput("plot", width = "400px")
)

server = function(input, output, session) {
  output$plot = renderPlot(plot(1:5))
}

shinyApp(ui, server)
