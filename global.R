library(shiny)
library(shinydashboard)
library(DT)
library(ggplot2)

car <- read.csv("Full Data.csv")
car[car == "NULL"] <- NA #the data uses NULL to represent missing values, updating it to R's method

car$PurchDate = as.Date(car$PurchDate,format = "%m/%d/%Y")
car$IsBadBuy = as.factor(car$IsBadBuy)

monster = paste0(car$SubModel,car$Size)

(car$cartype = gsub(".*?(SEDAN|TRUCK|SUV|VAN|COUPE|WAGON|CROSSOVER|HATCHBACK).*","\\1",monster))
(car$cartype[!(car$cartype %in% c("SEDAN","TRUCK","SUV","VAN","COUPE","WAGON","CROSSOVER","HATCHBACK"))] = "OTHER")
(car$cartype = as.factor(car$cartype))

car_mod = car[c("IsBadBuy","VehicleAge","Nationality","cartype","Auction","VehOdo")]

notLemon = which(car_mod$IsBadBuy == 0)
lemon = which(car_mod$IsBadBuy == 1)
keep = c(sample(notLemon,size = length(lemon)),lemon)

model = glm(IsBadBuy~VehicleAge+Nationality+cartype+Auction+VehOdo,data=car_mod[keep,],family=binomial())