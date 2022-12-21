library(shiny)
library(tidyverse)
library(ggplot2)

midwest <- midwest

# User-interface definitions

# Define UI frame
ui <- fluidPage(

    # Shiny app title
    headerPanel("Midwest Data Analysis"),

    # Sidebar panel for input selects
    sidebarLayout(
        sidebarPanel(

            # Drop down menu for state selection
            selectInput("stateSelect", h3("Select State"), midwest$state),
        ),

        # Main panel for displaying output
        mainPanel(
            plotOutput("scatterPlot")
        )
    )
)

# Server logic

# Define server logic required to draw a reactive histogram
server <- function(input, output, session) {
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

shinyApp(ui, server)
