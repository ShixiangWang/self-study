fluidPage(
  sliderInput("num", "Choose a number:", 1, 100, 50),
  plotOutput("hist")
)