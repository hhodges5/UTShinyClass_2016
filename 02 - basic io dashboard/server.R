shinyServer(function(input, output, session) {
  output$numberOutput = renderPrint(round(input$numbers))
  output$sliderOutput = renderText(input$slider)
  output$singleOutput = renderText(input$single)
  output$multipleOutput = renderPrint(input$multiple)
})