library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)

# Define server logic required to draw a histogram
dataset <- final_dataset

shinyServer(function(input, output) {
    output$plot1 <- renderPlot(
        ggplot(filter(dataset,region=="World" & Year<=input$year[2] & Year>=input$year[1]), aes(x=Year))+geom_line(aes(y=!!input$indicateur)))
        
    output$plot2 <- renderPlot(
        ggplot(filter(dataset,region==input$region1 & Year<=input$year[2] & Year>=input$year[1]), aes(x=Year))+geom_line(aes(y=!!input$indicateur)))
    
    output$plot3 <- renderPlot(
        ggplot(filter(dataset,region==input$region2 & Year<=input$year[2] & Year>=input$year[1]), aes(x=Year))+geom_line(aes(y=!!input$indicateur)))
    
})