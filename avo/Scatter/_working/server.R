# Server logic

# Define server logic required to draw a histogram
function(input, output, session) {
  
  filteredMidwest <- reactive({
    midwest %>%
      filter(state == input$stateSelect)
  })

  # Get data
  
    output$scatterPlot <- renderPlot({
        ggplot(filteredMidwest(), aes(percbelowpoverty, perchsd)) + 
        geom_point() +
        ggtitle("% Population of College Graduates v. % Population Below Poverty ") + 
        ylab("% below poverty") +
        xlab("% college graduates")
    })
  
  output$table <- renderTable({
    filteredMidwest()
  })

}
