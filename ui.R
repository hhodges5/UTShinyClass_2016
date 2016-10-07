library(shiny)

shinyUI(fluidPage(

  titlePanel("Lemon Predictor - Group 4"),

  sidebarLayout(
    sidebarPanel(
      ## We found that the model required the following to predict future values; 
      ## on the sidebar, we allow users to input their specific values for each.
      sliderInput("age",
                  "Age of Car",
                  min = 0,
                  max = 10,
                  value = 5),
      selectInput("house",
                  label = h3("Auction House"),
                  choices = list("Adesa" = 1,
                                 "Manheim" = 2,
                                 "Other" = 3),
                  selected = 1),
      numericInput("mileage", 
                   label = h3("Vehicle Mileage"), 
                   value = 50000),
      selectInput("nationality",
                  label=h3("Nationality"),
                  choices=list("American" = 1,
                               "Top Line Asian" = 2,
                               "Other Asian" = 3,
                               "Other" = 4,
                               "Null" = 5),
                  selected = 1),
      selectInput("cartype",
                  label=h3("Car Type"),
                  choices=list("Coupe" = 1,
                               "Crossover" = 2,
                               "Hatchback" = 3,
                               "Sedan" = 4,
                               "SUV" = 5,
                               "Truck" = 6,
                               "Van" = 7,
                               "Wagon" = 8),
                  selected = 1)),
    mainPanel(
      ## In the main panel, we are outputting the prediction from the server side.
      ## textOutput("prediction")
      textOutput("test"),
      textOutput("prediction")
    )
  )
))



