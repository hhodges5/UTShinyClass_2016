library(shiny)
library(shinydashboard)

mydata = read.csv("iris.csv",stringsAsFactors = F)

options(shiny.reactlog=TRUE) # Run in Window and press ctrl-f3 (cmd-f3 on Mac) to view the react log