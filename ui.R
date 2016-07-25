library(shiny)
library(shinythemes)
health <- read.csv("health.csv")


shinyUI(fluidPage(
  
  theme = shinytheme("journal"),
  
  #Title of Application
  headerPanel("health Situation"), 
  
  sidebarPanel( 
    
    selectInput("Factor", "Select the equation factor:", 
                choices= unique(as.character(health$factor))),
    
    radioButtons("Province", "Province:", 
                 choices= unique(as.character(health$province))),
    
    selectInput("District", "District:", 
                choices= unique(as.character(health$district))),
    
    
    
    
    
    h5("This is a simple application showing the health situation for
       114 districts of Pakistan")
    
    ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot"))
      
    )
  )
  
  #end of UI brackets
))