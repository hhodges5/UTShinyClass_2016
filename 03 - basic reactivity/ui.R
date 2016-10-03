dashboardPage(
  dashboardHeader(title = "Iris dashboard"),
  dashboardSidebar(
    selectInput("species","Flower Species",choices = unique(mydata$Species)),
    sliderInput("minSepalLength","Minimum Sepal Length",min = min(mydata$Sepal.Length),max=max(mydata$Sepal.Length),step = 0.1,value = min(mydata$Sepal.Length))
  ),
  dashboardBody(
    plotOutput("petalLbW"),
    verbatimTextOutput("filteredData")
  )
)