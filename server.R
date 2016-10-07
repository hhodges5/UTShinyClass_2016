library(shiny)

## First, prior to the call to shinyServer, we run the code
## to create the predictor model, as given to us.
car <- read.csv("Full Data.csv")

car[car == "NULL"] <- NA #the data uses NULL to represent missing values, updating it to R's method

car$PurchDate = as.Date(car$PurchDate,format = "%m/%d/%Y")
car$IsBadBuy = as.factor(car$IsBadBuy)

monster = paste0(car$SubModel,car$Size)

car$cartype = gsub(".*?(SEDAN|TRUCK|SUV|VAN|COUPE|WAGON|CROSSOVER|HATCHBACK).*","\\1",monster)
car$cartype[!(car$cartype %in% c("SEDAN","TRUCK","SUV","VAN","COUPE","WAGON","CROSSOVER","HATCHBACK"))] = "OTHER"
car$cartype = as.factor(car$cartype)

car_mod = car[c("IsBadBuy","VehicleAge","Nationality","cartype","Auction","VehOdo")]

notLemon = which(car_mod$IsBadBuy == 0)
lemon = which(car_mod$IsBadBuy == 1)
keep = c(sample(notLemon,size = length(lemon)),lemon)

model = glm(IsBadBuy~VehicleAge+Nationality+cartype+Auction+VehOdo,data=car_mod[keep,],family=binomial())

## We call the shinyServer.  The input should be the parameters set by the user.
shinyServer(
    function(input, output) {
      reactive({
      inputDataFrame <- data.frame(VehicleAge = input$age,
                                   Nationality = input$nationality,
                                   cartype = input$cartype,
                                   Auction = input$house,
                                   VehOdo = input$mileage)
      })
      
    # The prediction, based on the model, will take user input and output 
    # the result to output$prediction.
    output$prediction <- renderText(as.character(predict(model, newdata=inputDataFrame)))
    
    # For testing purposes:
    output$test <- renderText("hello world")
    }
)

