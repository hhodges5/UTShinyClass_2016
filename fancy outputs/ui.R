dashboardPage(
  dashboardHeader(title = "Iris dashboard"),
  dashboardSidebar(
    sliderInput("SepalLength","Sepal Length",min = min(mydata$Sepal.Length),max=max(mydata$Sepal.Length),step = 0.1,value = min(mydata$Sepal.Length)),
    sliderInput("SepalWidth","Sepal Width",min = min(mydata$Sepal.Width),max=max(mydata$Sepal.Width),step = 0.1,value = min(mydata$Sepal.Width)),
    sliderInput("PetalLength","Petal Length",min = min(mydata$Petal.Length),max=max(mydata$Petal.Length),step = 0.1,value = min(mydata$Petal.Length)),
    sliderInput("PetalWidth","Petal Width",min = min(mydata$Petal.Width),max=max(mydata$Petal.Width),step = 0.1,value = min(mydata$Petal.Width)),
    sidebarMenu(
      menuItem("Dashboard",tabName = "dashboard",icon = icon("dashboard")),
      menuItem("UI Source",tabName = "uisource",icon = icon("code")),
      menuItem("Server Source",tabName = "serversource",icon = icon("code")),
      menuItem("Global Source",tabName = "globalsource",icon = icon("code"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
        h2(textOutput("predictionOutput")),
        br(),
        plotlyOutput("petalLbW"),
        DT::dataTableOutput("filteredData")
      ),
      tabItem(tabName = "uisource",
        HTML(paste(readLines("ui.R"),collapse="<br>"))
      ),
      tabItem(tabName = "serversource",
        HTML(paste(readLines("server.R"),collapse="<br>"))
      ),
      tabItem(tabName = "globalsource",
        HTML(paste(readLines("global.R"),collapse="<br>"))
      )
    )
    
  )
)