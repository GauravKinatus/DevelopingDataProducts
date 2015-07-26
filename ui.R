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
        #Title of the app
        headerPanel("Wage Explorer - MD Wages Data"),
        
        sidebarPanel(
                sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                            value=1500, step=100),
                textOutput('CalculationText'),
                radioButtons('varGroupBy', 
                             label = h3("Group By?"),
                             choices = list("None" = 1,
                                       "Job Type" = 2,
                                       "Education" = 3),
                                   selected = 1
                                   ),
                checkboxInput('varRegressionLines','Show Regression Lines?')
        ),#/sidebarPane

# Main panel will show the output of the plot and the documentation Tab        
        mainPanel(
              # In the main panel, build a tabset with two tabs
                tabsetPanel(
                        # tab 1 is for the Plot and the calculations
                        tabPanel("Plot", 
                                 plotOutput('plot')),
                        #tab 2 is for the documentation from the Markdown file
                        tabPanel("Documentation", includeMarkdown("include.md"))
                )#end of tabsetPanel
        )#end of mainPanel
        
))#end of ShinyUI