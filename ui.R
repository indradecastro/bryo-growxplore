library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("By Species"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
        sidebarPanel(
              selectInput("moss",
                          "Select a moss species:",
                          c("Homalothecium", "Pleurochaete", "Bryum",
                            "Hypnum", "Syntrichia", "Dicranum"),
                          selected = "Dicranum")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(fluidRow(splitLayout(cellWidths = c("50%", "50%"),
                                   plotOutput("adults"),
                                   plotOutput("pures")))
        )
  )
))