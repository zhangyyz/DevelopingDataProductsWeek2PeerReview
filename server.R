library(shiny)


shinyServer(function(input, output) {

  library(ggplot2)
  
  #Use reactive feature to calculate the prediction model.
  calculatePredictionModel <- reactive({
    model <- lm(price~carat, data=diamonds)
    newdata <- data.frame(carat = seq(from=0.1, to=20, by=0.1))
    newdata$price <- predict(model, newdata = newdata)
    rownames(newdata) = seq(from=0.1, to=20, by=0.1)
    newdata
  }
  )   
  
  #Get the input carat and predicted price and draw the graph.
  drawPredictedPoint <- reactive({
    data_on_plot <- calculatePredictionModel()
    point <-  data_on_plot[as.character(input$carat),]
    ggplot(data=data_on_plot, aes(x=carat, y=price)) + 
      geom_line() + 
      geom_point(data=point, size=5, mapping = aes(x=carat, y=price))
  }
  )
  
  #Render the graph to an output variable.
  output$distPlot <- renderPlot({
    drawPredictedPoint()
  })
  
})
