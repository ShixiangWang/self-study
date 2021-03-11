# The guts of Shiny app
library(shiny)

ui <- fluidPage(
  # Front-end interface
)

server <- function(input, output, session) {
  # Back-end logic
}

shinyApp(ui, server)

# a session captures the state of one live instance of a shiny app


# Input -------------------------------------------------------------------

# The input argument is a list-like object that contains all the input data 
# sent from the browser, named according to the input ID.

ui <- fluidPage(
  numericInput("count", label = "Number of values", value = 100)
)

# Here we can use input$count in server() to access this container
# NOTE: Unlike a typical list, input objects are read-only.


# Output ------------------------------------------------------------------

# You always use the output object in concert with a render function, 
# as in the following simple example:
ui <- fluidPage(
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    "Hello human!"
  })
}

shinyApp(ui, server)

# The render function does two things:
# It sets up a reactive context that automatically tracks what inputs the output uses.
# It converts the output of your R code into HTML suitable for display on a web page.

