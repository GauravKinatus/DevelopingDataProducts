library(shiny)
library(ggplot2)
library(markdown)
library(ISLR)
data(Wage)

#load the Wages dataset in the memory
dataset <- Wage

# Lets build the UI with a two columns

# side bar will take all the inputs from the User
shinyUI(pageWithSidebar(
        
        headerPanel("Wage Explorer"),
        
        sidebarPanel(
                sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                            value=1500, step=100),
                radioButtons('varGroupBy', 
                             label = h3("Group By?"),
                             choices = list("None" = 1,
                                       "Job Type" = 2,
                                       "Education" = 3),
                                   selected = 1
                                   ),
                textInput('valueGroupNum','Number of Groups',value="1"),
                checkboxInput('varRegressionLines','Show Regression Lines?')
        ),#/sidebarPane

# Main panel will show the output of the plot and the documentation Tab        
        mainPanel(
                tabsetPanel(
                        tabPanel("Plot", plotOutput('plot')),
                        tabPanel("Documentation", includeMarkdown("include.md"))
                )
        )
        
))