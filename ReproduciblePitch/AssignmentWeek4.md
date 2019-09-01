---
title: "DDP-Week4-Assignment"
author: "Kuldeep SIngh Meena"
date: "August 31, 2019"
runtime: shiny
output: ioslides_presentation
---



## Overview

This is a RStudio shiny application developed as a part of Developing Data Products course under Data Science. The application summarizes Call Center Measurements for an entire call center(includes call management and quality management), as well as by subgroups made up of three teams. 

This is the initial attempt at creating a broader reporting format for Call Center Management Reports. Eventually the goal is to have hyperlinks within the App that will lead to more detailed information for each of the measures as well as each Team.

## The Application includes the following:

- Form of Input used: Radio Button
- Reactive output displayed as a result of server calculations: The user (call Center Manager) can select one or more teams to compare Performance Results 
- The server.R and ui.R codes are posted on github at: <https://github.com/kuldeep3005/Developing-Data-Products-Week-4-Assignment>
- The App can be found at: <https://kuldeep3005.shinyapps.io/Week4Assignment/>

## R Code for the Application


```r
# Ui.R code
library(shiny)
Perform <- read.csv("CCP.csv")
fluidPage(
  checkboxGroupInput("variable", "Variables:",
                     c("Overall Results" = "Overall",
                       "Team 1 Results" = "Team1",
                       "Team 2 Results" = "Team2",
                       "Team 3 Results" = "Team3")),
  tableOutput("data")
)
```

<!--html_preserve--><div class="container-fluid">
<div id="variable" class="form-group shiny-input-checkboxgroup shiny-input-container">
<label class="control-label" for="variable">Variables:</label>
<div class="shiny-options-group">
<div class="checkbox">
<label>
<input type="checkbox" name="variable" value="Overall"/>
<span>Overall Results</span>
</label>
</div>
<div class="checkbox">
<label>
<input type="checkbox" name="variable" value="Team1"/>
<span>Team 1 Results</span>
</label>
</div>
<div class="checkbox">
<label>
<input type="checkbox" name="variable" value="Team2"/>
<span>Team 2 Results</span>
</label>
</div>
<div class="checkbox">
<label>
<input type="checkbox" name="variable" value="Team3"/>
<span>Team 3 Results</span>
</label>
</div>
</div>
</div>
<div id="data" class="shiny-html-output"></div>
</div><!--/html_preserve-->

```r
# Server.R code
function(input, output, session) {
  output$data <- renderTable({
    Perform[, c("Performance.Measures", input$variable), drop = FALSE]
  }, rownames = TRUE)
}
```

```
## function(input, output, session) {
##   output$data <- renderTable({
##     Perform[, c("Performance.Measures", input$variable), drop = FALSE]
##   }, rownames = TRUE)
## }
```

## Table of Data 


```
##       Performance.Measures  Overall   Team1   Team2   Team3
## 1      Average Handle Time  0:02:53 0:02:43 0:02:41 0:03:39
## 2        Average Wait Time 00:29.26    <NA>    <NA>    <NA>
## 3    % Time in "Not Ready"   15.05%  14.95%  14.49%  16.33%
## 4     % Calls Not Answered    0.67%   0.69%   0.91%   0.26%
## 5      Adherence Measure 1   96.73%  95.38%  97.41%  97.85%
## 6      Adherence Measure 2   98.74%  98.40%  98.46% 100.00%
## 7      Adherence Measure 3   95.90%  98.40%  96.15%  90.32%
## 8      Adherence Measure 4   94.54%  93.59%  93.73%  98.02%
## 9        Quality Measure 1  100.00% 100.00% 100.00% 100.00%
## 10       Quality Measure 2   99.12%  98.86%  99.36%  99.25%
## 11 Overall Converted Score    78.32   81.87   80.83   75.12
```

This is the table of data that was used for this application.
