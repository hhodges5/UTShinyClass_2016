dashboardPage(
  dashboardHeader(title = "Iris dashboard"),
  dashboardSidebar(
    sliderInput("SepalLength","Sepal Length",min = min(mydata$Sepal.Length),max=max(mydata$Sepal.Length),step = 0.1,value = min(mydata$Sepal.Length)),
    sliderInput("SepalWidth","Sepal Width",min = min(mydata$Sepal.Width),max=max(mydata$Sepal.Width),step = 0.1,value = min(mydata$Sepal.Width)),
    sliderInput("PetalLength","Petal Length",min = min(mydata$Petal.Length),max=max(mydata$Petal.Length),step = 0.1,value = min(mydata$Petal.Length)),
    sliderInput("PetalWidth","Petal Width",min = min(mydata$Petal.Width),max=max(mydata$Petal.Width),step = 0.1,value = min(mydata$Petal.Width))
  ),
  dashboardBody(
    h2(textOutput("predictionOutput")),
    br(),
    plotlyOutput("petalLbW"),
    DT::dataTableOutput("filteredData")
  )
)