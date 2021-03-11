# Layout functions provide the high-level visual structure of an app
# Here we’ll focus on fluidPage()

library(shiny)

ui = fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs", "Observations:", min = 0, max = 1000, value = 500)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server = function(input, output, session) {
  
}

shinyApp(ui, server)


# Page with sidebar -------------------------------------------------------

# sidebarLayout() makes it easy to create a two-column layout 
# with inputs on the left and outputs on the right. 
# The basic code looks like this:
fluidPage(
  headerPanel(
    # app title/description
  ),
  sidebarLayout(
    sidebarPanel(
      # inputs
    ),
    mainPanel(
      # outputs
    )
  )
)
# see <https://d33wubrfki0l68.cloudfront.net/a2f768fb46acbdaa71b5eb508393fb24d4d26020/8200c/diagrams/basic-ui/sidebar.png>

# an example:
ui <- fluidPage(
  headerPanel("Central limit theorem"),
  sidebarLayout(
    sidebarPanel(
      numericInput("m", "Number of samples:", 2, min = 1, max = 100)
    ),
    mainPanel(
      plotOutput("hist")
    )
  )
)
server <- function(input, output, server) {
  output$hist <- renderPlot({
    means <- replicate(1e4, mean(runif(input$m)))
    hist(means, breaks = 20)
  })
}

shinyApp(ui, server)


# Multi-row ---------------------------------------------------------------

# Under the hood, sidebarLayout() is built on top of a flexible multi-row 
# layout, which you can use this directly to create more visually complex apps.
#
# As usual, you start with fluidPage(). 
# Then you create rows with fluidRow(), and columns with column(). 
# The basic code structure looks like this:

fluidPage(
  fluidRow(
    column(4, 
           ...
    ),
    column(8, 
           ...
    )
  ),
  fluidRow(
    column(6, 
           ...
    ),
    column(6, 
           ...
    )
  )
)

# see <https://d33wubrfki0l68.cloudfront.net/bb9dffe04f31627d7eb552b73227f7315ca20585/de3d9/diagrams/basic-ui/multirow.png>
# NOTE: the width of each row must add up to 12.


# Themes ------------------------------------------------------------------

# Creating a complete theme from scratch is a lot of work (but often worth it!), 
# but you can get some easy wins by using the shinythemes package. 
# The following code shows four options:
theme_demo <- function(theme) {
  fluidPage(
    theme = shinythemes::shinytheme(theme),
    sidebarLayout(
      sidebarPanel(
        textInput("txt", "Text input:", "text here"),
        sliderInput("slider", "Slider input:", 1, 100, 30)
      ),
      mainPanel(
        h1("Header 1"),
        h2("Header 2"),
        p("Some text")
      )
    )
  )
}
theme_demo("darkly")
theme_demo("flatly")
theme_demo("sandstone")
theme_demo("united")
# select theme provided by shiny https://shiny.rstudio.com/gallery/shiny-theme-selector.html

