dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(
    numericInput("numbers","This is a numeric input",value = 10, min = 1, max = 20, step = 0.1),
    sliderInput("slider","This is a slider input",value = 10, min = 1, max = 20, step = 0.1),
    selectInput("single","This is a single select input",choices = letters),
    selectInput("multiple","This is a multi select input",choices = LETTERS,multiple = T)
  ),
  dashboardBody(
    verbatimTextOutput("numberOutput"),
    textOutput("sliderOutput"),
    textOutput("singleOutput"),
    verbatimTextOutput("multipleOutput")
  )
)