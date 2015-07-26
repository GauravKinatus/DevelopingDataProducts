# Shiny App to review the WAGE data from the ISLR packet
# Author: Gaurav Garg (gaurav_garg@yahoo.com)
# Coursera Data Specialization Class - Developing Data Products/Peer reviewed project
# July 2015 session
library(shiny)
library(ggplot2)
library(markdown)
library(ISLR)
library(Hmisc)

#Backend server code for the Shiny App
# server.R and UI.R needs to be deployed on shinyApps.io or run locally
shinyServer(function(input, output) {
        
        dataset <- reactive(function() {
                Wage[sample(nrow(Wage), input$sampleSize),]
        })
        
        output$plot <- reactivePlot(function() {
                #Start with the basic plot with out any colors assignment to the group by category
                if(input$varGroupBy == 1) # no grouping selected in the UI
                        p <-qplot(age,wage,data=dataset())
                else if (input$varGroupBy == 2) # Group the datapoints by Job Class
                        p <-qplot(age,wage, colour=jobclass,data=dataset())
                else if (input$varGroupBy == 3) # Group the datapoints by Education
                        p <-qplot(age,wage,colour=education,data=dataset())
        
                # did the user select the option the add the regression lines?                        
                if (input$varRegressionLines)
                        p <- p + geom_smooth(method='lm',formula=y~x)

                #send the output to the plot area
                print(p)
                
                cutWage <- cut2(dataset(),g<=input$valueGroupNum)                
        }, height=500) # Height > 500 requires the user to scroll to see the entire plot
        
 
})