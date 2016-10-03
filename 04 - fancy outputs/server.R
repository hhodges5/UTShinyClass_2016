shinyServer(function(input, output, session) {
  #make a reactive
  newData = reactive({
    newData = data.frame(Sepal.Length=input$SepalLength,
      Sepal.Width = input$SepalWidth,
      Petal.Length = input$PetalLength,
      Petal.Width = input$PetalWidth)
  })
  
  dataToPlot = reactive({
    nd = newData()
    nd$Species = "New Prediction"
    nd$isVirginica = prediction() > 0.5
    md = mydata
    rbind(md,nd)
  })
  
  prediction = reactive({
    pred = predict(model,newData(),type = "response")
  })
  
  #print out a reactive
  output$predictionOutput = renderText({
    if(prediction() > 0.5) "It's Virginica!" else "Sorry, you have an inferior flower."
  })
  
  output$filteredData = DT::renderDataTable(mydata)
  
  output$petalLbW = renderPlotly({
    plot_ly(y=Petal.Length,x=Petal.Width,data=dataToPlot(),color=Species,mode='markers')
  })
})