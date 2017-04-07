#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library("stringr")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$piePlot <- renderPlot({
    vowel = c("a","e","i","o","u")
    vowelnumber <- 0
    totalleters <- 1
    main <- "Please, consider that only one word is supported"
    
    texttoanalyse <- input$texttoanalyse
    
    ## check that only one word is considered
    if (length(str_split(texttoanalyse,boundary("word"))[[1]]) == 1) {
          titlegraph <- paste("The word is: ",texttoanalyse)
            ## nro de vocales lower
          vowelnumber = sum(str_count(str_split(str_to_lower(texttoanalyse),boundary("word"))[[1]], 
                            pattern = vowel) 
                        )
          totalleters <- sum(str_length(str_split(texttoanalyse,boundary("word"))[[1]]))
    } else {
          titlegraph <- "Please, consider that only one word is supported"
          vowelnumber = 0
    }
    
    ## PIE GRAPH
    pie( x = cbind(a = vowelnumber, b = totalleters-vowelnumber),
         labels =  c(paste(round(vowelnumber*100/totalleters,3),"%"),"others"),
         col= c(colors()[80+input$bins],"blue"), 
         main= titlegraph,
         clockwise = TRUE
    )
    
  })
  
})
