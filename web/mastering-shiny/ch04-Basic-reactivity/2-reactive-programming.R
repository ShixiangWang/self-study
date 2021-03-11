library(shiny)

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name, "!")
  })
}

shinyApp(ui, server)

server <- function(input, output, session) {
  text <- reactive(paste0("Hello ", input$name, "!"))
  output$greeting <- renderText(text())
}

shinyApp(ui, server)

# The following order is also right but should avoid
server <- function(input, output, session) {
  output$greeting <- renderText(text())
  text <- reactive(paste0("Hello ", input$name, "!"))
}

shinyApp(ui, server)



# Reactive expressions ----------------------------------------------------

library(ggplot2)

histogram <- function(x1, x2, binwidth = 0.1, xlim = c(-3, 3)) {
  df <- data.frame(
    x = c(x1, x2),
    g = c(rep("x1", length(x1)), rep("x2", length(x2)))
  )
  
  ggplot(df, aes(x, fill = g)) +
    geom_histogram(binwidth = binwidth) +
    coord_cartesian(xlim = xlim)
}

t_test <- function(x1, x2) {
  test <- t.test(x1, x2)
  
  sprintf(
    "p value: %0.3f\n[%0.2f, %0.2f]",
    test$p.value, test$conf.int[1], test$conf.int[2]
  )
}

ui <- fluidPage(
  fluidRow(
    column(4, 
           "Distribution 1",
           numericInput("n1", label = "n", value = 1000, min = 1),
           numericInput("mean1", label = "µ", value = 0, step = 0.1),
           numericInput("sd1", label = "σ", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(4, 
           "Distribution 2",
           numericInput("n2", label = "n", value = 1000, min = 1),
           numericInput("mean2", label = "µ", value = 0, step = 0.1),
           numericInput("sd2", label = "σ", value = 0.5, min = 0.1, step = 0.1)
    ),
    column(4,
           "Histogram",
           numericInput("binwidth", label = "Bin width", value = 0.1, step = 0.1),
           sliderInput("range", label = "range", value = c(-3, 3), min = -5, max = 5)
    )
  ),
  fluidRow(
    column(9, plotOutput("hist")),
    column(3, verbatimTextOutput("ttest"))
  )
)

server <- function(input, output, session) {
  output$hist <- renderPlot({
    x1 <- rnorm(input$n1, input$mean1, input$sd1)
    x2 <- rnorm(input$n2, input$mean2, input$sd2)
    
    histogram(x1, x2, binwidth = input$binwidth, xlim = input$range)
  })
  
  output$ttest <- renderText({
    x1 <- rnorm(input$n1, input$mean1, input$sd1)
    x2 <- rnorm(input$n2, input$mean2, input$sd2)
    
    t_test(x1, x2)
  })
}

shinyApp(ui, server)


# Simplifying the app -----------------------------------------------------

server <- function(input, output, session) {
  x1 <- reactive(rnorm(input$n_1, input$mean_1, input$sd_1))
  x2 <- reactive(rnorm(input$n_2, input$mean_2, input$sd_2))
  
  output$hist <- renderPlot({
    histogram(x1(), x2(), binwidth = input$binwidth, xlim = input$range)
  })
  
  output$ttest <- renderText({
    t_test(x1(), x2())
  })
}

shinyApp(ui, server)

# In Shiny, however, I think you should adopt the rule of one:
# whenever you copy and paste something once, you should consider 
# extracting the repeated code out into a reactive expression. 
# The rule is stricter for Shiny, because reactive expressions
# don’t just make it easier for humans to understand the code, 
# they also improve Shiny’s ability to efficiently rerun code.


# Controlling timing of evaluation ----------------------------------------

ui <- fluidPage(
  fluidRow(
    column(3, 
           numericInput("lambda1", label = "lambda1", value = 1),
           numericInput("lambda2", label = "lambda1", value = 1),
           numericInput("n", label = "n", value = 1e4, min = 0)
    ),
    column(9, plotOutput("hist"))
  )
)
server <- function(input, output, session) {
  x1 <- reactive(rpois(input$n, input$lambda1))
  x2 <- reactive(rpois(input$n, input$lambda2))
  output$hist <- renderPlot({
    histogram(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  })
}

shinyApp(ui, server)

# Timed invalidation
# We can increase the frequencly of updates with a new function: reactiveTimer().
# reactiveTimer() is a reactive expression that has a dependency on a hidden input: the current time.

server <- function(input, output, session) {
  # uses a interval of 500 ms so that 
  # the plot will update twice a second.
  timer <- reactiveTimer(500)
  
  x1 <- reactive({
    # This lets x1 and x2 take a 
    # reactive dependency on timer
    timer()
    rpois(input$n, input$lambda1)
  })
  x2 <- reactive({
    timer()
    rpois(input$n, input$lambda2)
  })
  
  output$hist <- renderPlot({
    histogram(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  })
}

shinyApp(ui, server)
# see <https://d33wubrfki0l68.cloudfront.net/6ad166ae11953c0ae612b56541e08bdfafd00bec/f7321/diagrams/basic-reactivity/timing-timer.png>

# On click
# use actionButton()
ui <- fluidPage(
  fluidRow(
    column(3, 
           numericInput("lambda1", label = "lambda1", value = 1),
           numericInput("lambda2", label = "lambda1", value = 1),
           numericInput("n", label = "n", value = 1e4, min = 0),
           actionButton("simulate", "Simulate!")
    ),
    column(9, plotOutput("hist"))
  )
)

server <- function(input, output, session) {
  x1 <- reactive({
    # we refer to simulate without using its value to 
    # take a reactive dependency on it.
    input$simulate
    rpois(input$n, input$lambda1)
  })
  x2 <- reactive({
    input$simulate
    rpois(input$n, input$lambda2)
  })
  output$hist <- renderPlot({
    histogram(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  })
}

shinyApp(ui, server)

# This doesn’t achieve our goal because it just 
# introduces an new dependency: x1() and x2() 
# will update when we click the simulate button, 
# but they’ll also continue to update when lambda1,
# lambda2, or n change. We want to replace the 
# existing dependencies, not supplement them.


# new tool: eventReactive()
server <- function(input, output, session) {
  x1 <- eventReactive(input$simulate, {
    rpois(input$n, input$lambda1)
  })
  x2 <- eventReactive(input$simulate, {
    rpois(input$n, input$lambda2)
  })
  
  output$hist <- renderPlot({
    histogram(x1(), x2(), binwidth = 1, xlim = c(0, 40))
  })
}

shinyApp(ui, server)


# Observers ---------------------------------------------------------------

# So far, we’ve focussed on what’s happening inside the app.
# But sometimes you need to reach outside of the app 
# and cause side-effects to happen elsewhere in the 
# world. This might be saving a file to a shared network
# drive, sending data to a web API, updating a 
# database, or (most commonly) printing a debugging 
# message to the console. These actions don’t affect 
# how your app looks, so you can’t use an output and 
# a render function. Instead you need to use an 
# observer.

# observeEvent() is very similar to eventReactive().
# It has two important arguments: eventExpr and 
# handlerExpr. The first argument is the input or 
# expression to take a dependency on; the second 
# argument is the code that will be run. 
# For example, the following modification to 
# server() means that everytime that text is updated, 
# a message will be sent to the console:

server <- function(input, output, session) {
  text <- reactive(paste0("Hello ", input$name, "!"))
  
  output$greeting <- renderText(text())
  observeEvent(input$name, {
    message("Greeting performed")
  })
}

# There are two important difference between observeEvent() and eventReactive():
# 1. You don’t assign the result of observeEvent() to a variable, so
# 2. You can’t refer to it from other reactive consumers.


