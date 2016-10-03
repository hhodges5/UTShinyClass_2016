shinyServer(function(input, output, session) {
  #make a reactive
  data2plot = reactive({
    mydata[mydata$Species == input$species & mydata$Sepal.Length >= input$minSepalLength,]
  })
  
  #print out a reactive
  output$filteredData = renderPrint(data2plot())
  
  output$petalLbW = renderPlot({
    plot(Petal.Length~Petal.Width,data=data2plot(),pwd=Sepal.Width)
  })
})