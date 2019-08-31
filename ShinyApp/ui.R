#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

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