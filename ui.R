ui <- fluidPage(
  titlePanel("Car Data"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", min = 0, max = 100,
                  value = c(25, 40), pre = "$"),
      radioButtons("typeInput", "Vehicle type",
                   choices = c("SEDAN","TRUCK","SUV","VAN","COUPE","WAGON","CROSSOVER","HATCHBACK"),
                   selected = "HATCHBACK"),
      selectInput("nationalityInput","Country",
                  choices = c("AMERICAN","NULL","OTHER","ASIAN","TOP LINE ASIAN"))
    ),
    mainPanel(
      plotOutput("carplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)