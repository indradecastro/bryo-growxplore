library(shiny)
raw <- read.table("20180124.eval.cualitativa.csv", header=T, na.strings="", sep="\t")

# Define server logic required to draw a histogram
shinyServer(function(input, output){
      
      moss <- reactive({as.character(input$moss)})
      
  output$adults <- renderPlot({
    # subset data based on input$moss from ui.R
        adults <- raw[which(raw$tipo=="adult" & raw$sp==agrep(pattern=moss(), x=raw$sp, value=T)),]
        
    # draw the histogram with the specified number of bins
    barplot(table(adults$adult)/nrow(adults)*100, ylim=c(0,100), ylab="percentage of samples")
           legend(legend=c("A: Growth", "B: Same", "C: Damage <50%", "D: Damage >50%"),
                  title="Growth & Damage", "topright", bty="n", cex=1)
  })
  
  output$pures <- renderPlot({
        # subset data based on input$moss from ui.R
        pures <- raw[which(raw$tipo=="pure" & raw$sp==agrep(pattern=moss(), x=raw$sp, value=T)),]
        
        # draw the histogram with the specified number of bins
        barplot(table(pures$pure)/nrow(pures)*100, ylim=c(0,100), ylab="percentage of samples")
               legend(legend=c("0: zero"),
                      title="Growth percentage", "topright", bty="n", cex=1)
  })
  
})
