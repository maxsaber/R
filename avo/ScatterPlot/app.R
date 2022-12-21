# Load libraries
  library(shiny)
  library(ggplot2)
  library(rsconnect)

# Load data
  data(midwest)

# Define UI for application that creates a scatterplot
ui <- fluidPage(

  titlePanel("Midwest Demographics"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          radioButtons(inputId = "state", label = "State",
                       choices = list("Illonis" = "IL",
                         "Indiana" = "IN",
                         "Michigan" = "MI",
                         "Ohio" = "OH",
                         "Wisconsin" = "WI"),selected = "IL")
                       )
          ),

        # Show a plot of the generated distribution
        mainPanel(
          
          # Display output  
          plotOutput("distPlot")
        )
    )

# Define server logic required to draw the scatterplot
server <- function(input, output) {

    output$distPlot <- renderPlot({
      
      state <- input$state
      
        ggplot(midwest) + 
          geom_point(aes(x = percbelowpoverty,
                         y = perchsd))
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
