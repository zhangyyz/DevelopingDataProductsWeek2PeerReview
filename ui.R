library(shiny)

# Define UI for application that draws a prediction of diamond price based on carat
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Diamond Price by caret"),
  
  p(paste0("The following graph is a prediction model for diamond price based on the carat. You can use the slide bar to input the diamond carat,", 
           "and the graph will move the black point automatically to relect the predicted price for you.")),
  
  # Sidebar with a slider input for diamond carat 
  sidebarLayout(
    sidebarPanel(
       sliderInput("carat",
                   "Diamond carat:",
                   min = 0.1,
                   max = 20,
                   value = 0.1)
    ),
    
    # Show a plot of the predicted price
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
