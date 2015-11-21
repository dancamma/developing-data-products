library(shiny)

fit <- lm(mpg ~ cyl + wt + hp, data = mtcars)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$mpg <- renderText({
    predict(fit, data.frame(cyl=input$cyl, wt = input$weight, hp = input$hp))
  })
  output$cyl <- renderText({input$cyl})
  output$wt <- renderText({input$weight})
  output$hp <- renderText({input$hp})
})