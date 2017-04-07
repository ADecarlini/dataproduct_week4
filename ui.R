#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Percentage of vowels in the given word"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("bins",
                   "Select the color for vowels in the pie chart:",
                   min = 1,
                   max = 50,
                   value = 30),
    textInput("texttoanalyse","Insert the word to analyse:"),
    submitButton(text="analyse now"),
    h2(""),
    a("For online help, clik here and see the Slidify manual", href="http://www.google.com")
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("piePlot")
    )
  )
))


