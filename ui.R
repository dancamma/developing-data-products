library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles/(US) gallon Predictor"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("cyl",
                  "Number of Cylinders",
                  min = 4,
                  max = 8,
                  value = 6,
                  step = 2),
      sliderInput("weight",
                  "Weight (1000 lbs)",
                  min = 1.5,
                  max = 5.5,
                  value = 2,
                  step = 0.1),
      sliderInput("hp",
                  "Gross horsepower",
                  min = 52,
                  max = 335,
                  value = 75,
                  step = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Instructions"),
      HTML("<p>This webapp will predict the <strong>Miles/(US) gallon</strong> of a car, given three predictors:</p>"),
      HTML("<ul><li>The <strong>Number of Cylinders</strong> (allowed values: 4, 6 or 8)</li><li>The <strong>Weight</strong> in 1000 of lb</li><li>Gross <strong>Horsepower</strong></li></ul>"),
      HTML("<p>The data is taken from the <strong>mtcars</strong> dataset from the dataset package</p>"),
      br(),
      HTML("<p>Use the <strong>sliders</strong> to change the input of the prediction, and the result will appear <strong>immediately</strong> below.</p>"),
      h2("Results"),
      p("A car with these characteristics: "),
      span("Number of Cylinder:"),
      textOutput("cyl",inline = TRUE,container = strong),
      br(),
      span("Weight (1000 lbs):"),
      textOutput("wt",inline = TRUE,container = strong),
      br(),
      span("Gross horsepower:"),
      textOutput("hp",inline = TRUE,container = strong),
      br(),
      br(),
      span("Will have a Miles/(US) gallon value of: "),
      textOutput("mpg",inline = TRUE,container = strong)
    )
  )
))