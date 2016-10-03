library(shiny)
library(shinydashboard)
library(DT)
library(plotly)

mydata = read.csv("iris.csv",stringsAsFactors = F)

options(shiny.reactlog=TRUE) # Run in Window and press ctrl-f3 (cmd-f3 on Mac) to view the react log

mydata$isVirginica = mydata$Species == "virginica"
model = glm(isVirginica~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,family=binomial(link = "logit"),data=mydata)
