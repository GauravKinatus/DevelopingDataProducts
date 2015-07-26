---
title: "include.md"
author: "Gaurav Garg (gaurav_garg@yahoo.com)"
date: "July 25, 2015"
output: html_document
---

# Shiny App 
This is a simple App built using the Shiny package to show interactive User Experience. The application allows the user to create an interactive plot based on the Wage dataset from the ISLR package.  

The app gives the user the ability to choose: 

1. *Sample data size:* By default, the data set loads half the data (1500) records. The slider input can be used to change the sample size in steps of 100 records. Based on the slider value, **I calculate the sample size in percentage**. 

2. *Group Data by:* By default the plot does not show any groupings. If the user wants to see the different groupings, the App allows the user to gropu by Job categrory or Education.  

3. *Regression Lines*: Finally the app allows the user to add regression lines based on the linear modeling.  


The backend server uses qplot to build the plots and uses simple conditional logic to change the color variable in qplot(). 

# WAGE {ISLR} 
Wage and other data for a group of 3000 workers in the Mid-Atlantic region. 

# Source 
Data was manually assembled by Steve Miller, of Open BI (www.openbi.com), from the March 2011 Supplement to Current Population Survey data. 
http://thedataweb.rm.census.gov/TheDataWeb

# References 
Games, G., Witten, D., Hastie, T., and Tibshirani, R. (2013) An Introduction to Statistical Learning with applications in R, www.StatLearning.com, Springer-Verlag, New York