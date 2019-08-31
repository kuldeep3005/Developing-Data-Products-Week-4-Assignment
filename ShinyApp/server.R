#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)

function(input, output, session) {
    output$data <- renderTable({
        Perform[, c("Performance.Measures", input$variable), drop = FALSE]
    }, rownames = TRUE)
}

# shinyApp(ui, server)

