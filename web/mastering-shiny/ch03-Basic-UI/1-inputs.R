library(shiny)


# Common structure --------------------------------------------------------

# Arguments of input functions
# First 'inputID' - must be a valid name and unique used to connect the fronted with the backend
# Second 'label' - human-readable label for the control
# Third 'value' - set default value if possible
# Others are unique to the control

# Style suggestion:
# The first two arguments provided by position,
# and the remaining provided by name
sliderInput('min', "Limit (minimum)", 
            value = 50, min = 0, max = 100)



# Free text ---------------------------------------------------------------

ui = fluidPage(
  # For small amounts of text
  textInput("name", "What's your name?"),
  # For passwords
  passwordInput("password", "What's your password?"),
  # For paragraphs of text
  textAreaInput("story", "Tell me about yourself", rows = 3, cols = 80)
)

server = function(input, output, session) {
  
}

shinyApp(ui, server)



# Numeric inputs ----------------------------------------------------------

ui = fluidPage(
  # For a constrained textbox
  numericInput("num", "Number one", 
               value = 0, min = 0, max = 100),
  # Create a slider
  sliderInput("num2", "Number two",
              value = 50, min = 0, max = 100),
  # Create a range slider
  sliderInput("rng", "Range", 
              value = c(10, 20), min = 0, max = 100)
)

shinyApp(ui, server)



# Dates -------------------------------------------------------------------

# The following two arguments used to restrict valid inputs
# datesdisabled
# daysofweekdisabled
#
# The following three arguments used to create app for non-Americans
# format
# language
# week start
ui = fluidPage(
  # Create a single date
  dateInput("dob", "When were you born?"),
  # Create a range of two days
  dateRangeInput("holiday", "When do you want to go on vacation next?")
)

shinyApp(ui, server)


ui = fluidPage(
  # Create a single date
  dateInput("dob", "When were you born?", language = "zh-CN"),
  # Create a range of two days
  dateRangeInput("holiday", "When do you want to go on vacation next?")
)

shinyApp(ui, server)



# Limited choices ---------------------------------------------------------

animals = c("dog", "cat", "mouse", "bird", "other", "I hate animals")

ui = fluidPage(
  selectInput("state", "What's your favourite state?", choices = state.name),
  radioButtons("animal", "What's your favourite animal?", choices = animals)
)

shinyApp(ui, server)

# Two nice features of radio button:
# 1. show all possible options, making them suitable for short lists
# 2. display options other than plain text
ui = fluidPage(
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad")
  )
)

shinyApp(ui, server)

# Select multiple values
# This is cannot implemented by raido buttons
ui = fluidPage(
  checkboxGroupInput("animal", "What's your favourite animal?", 
                     choices = animals)
)

shinyApp(ui, server)

# This is more suitable for longer options
# Set multiple=TRUE to allow multiple values
ui <- fluidPage(
  selectInput(
    "state", "What's your favourite state?", 
    choices = state.name,
    multiple = TRUE
  )
)

shinyApp(ui, server)



# Yes/no question ---------------------------------------------------------

ui <- fluidPage(
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?")
)

shinyApp(ui, server)


# File uploads and action buttons -----------------------------------------

# Use fileInput()
# Use actionButton()


# Exercises ---------------------------------------------------------------

# 1.
ui <- fluidPage(
  textInput("use_placeholder", label = NULL, placeholder = "Your name")
)

shinyApp(ui, server)

# 2.
today <- Sys.Date()
ui <- fluidPage(
  sliderInput("delivery", "When should we deliver?", 
              today, 
              min = today, 
              max = today + 7, 
              step = 1, round = TRUE))


shinyApp(ui, server)
