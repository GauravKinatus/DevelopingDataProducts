Wages Shiny App Presentation
========================================================
author: Gaurav Garg (gaurav_garg@yahoo.com)
date: Jul 26th, 2015

Building a Shiny App
========================================================
The Wage Explorer is a Shiny App, deployed on the Shiny server. 
https://kinatus.shinyapps.io/Project

```r
library(ISLR)
library(ggplot2)
```
Wage dataset in the ISLR package has Wage and other data for a group of 3000 workers in the Mid-Atlantic region. The app showcases the following aspects.
- How to create a simple Shiny App
- Creating a Plot from the Wages data
- Using the Inputs and Outputs to build interactive User Experience
- Integrating Calculations within the HTML page

Plot from Wages data
========================================================
The Wage Exploer app uses the qplot() to visualize the data from the dataset. We will use the colour parameter in the qplot() to give user some options.

![plot of chunk unnamed-chunk-2](WagesShinyAppDeck-figure/unnamed-chunk-2-1.png) 

Lets see what the plot should look like with datapoints coloured by the education. 

User Interface - Inputs and Outputs
========================================================
I use the radioButtons() in Shiny inputs to set which column should be used for the colour parameter. in UI.r, variable varGroupBy is assigned 1 (no Group By), 2 (Job classification) or 3 (education).

Similarly, variable varRegressionLines is assigned a TRUE/FALSE value from the checkbox to add regression lines to the plot.

```r
#sample input value. These values should be set in UI.R
varGroupBy <- 2
varRegressionLines <- TRUE

# Conditional code in Server.R
if(varGroupBy == 1) # no grouping selected in the UI
       { p <- qplot(age,wage,data=Wage)}
if (varGroupBy == 2) # Group the datapoints by Job Class
        {p <- qplot(age,wage, colour=jobclass,data=Wage)}
if (varGroupBy == 3) # Group the datapoints by Education
        {p <- qplot(age,wage,colour=education,data=Wage)}

# did the user select the option the add the regression lines?                        
if (varRegressionLines)
        p <- p+geom_smooth(method='lm',formula=y~x)
        
p
```

![plot of chunk unnamed-chunk-3](WagesShinyAppDeck-figure/unnamed-chunk-3-1.png) 

Calculation Piece
========================================================
Course requires use to take an input, do some calculations and display the result back in the HTML. I use the SampleSize from the slider input to calculation the training set size.

```r
#UI.r will set the value of SampleSize
sampleSize <- 1500

# Calculate the training set size. By default the value of sampleSize variable is set to 1500
paste("You have selected sample size of ",sampleSize,
                      " which results in a training set of", 
                      round((sampleSize/nrow(Wage)*100),2),
                      "%.")
```

```
[1] "You have selected sample size of  1500  which results in a training set of 50 %."
```
