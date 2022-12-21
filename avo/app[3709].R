# loading packages 
library(shiny)
library(shinythemes)
library(tidyverse)

midwest <- midwest

# Define UI for application that draws a histogram
ui <- fluidPage(
  # theme = shinytheme("cerulean"),
  # Application title
  titlePanel("Midwest Dataset"),
  selectInput("stateInput", "State:",midwest$state),
  # selectInput(inputId = "XInput", 
  #             label = "X",
  #             choices = list("midwest$percollege","midwest$percbelowpoverty")),
  # selectInput(inputId = "YInput", 
  #             label = "Y",
  #             choices = list("midwest$percollege","midwest$percbelowpoverty")),
   #plot output
    mainPanel(
        plotOutput("scatterplot")
    )    #! <<< missing this block to render the scatterplot on the final app
)  #! <<< missing this closing paren
# Define server logic required to create a reactive plot 
server <- function(input, output) {

# filtered <- reactive({
#   midwest %>% filter(state == input$state)   #! <<< change to input$stateInput
# })``    #! <<< this was right :)

  output$scatterplot <- renderPlot({
    #draw scatterplot 
    #midwest %>% #! <<< take this out
      ggplot(filtered(), aes(x = percbelowpoverty, y = percollege, color = state)) +
      #aes(x = input$XInput, y = input$YInput)) +
      geom_point(aes(group = input$stateInput, color = input$stateInput)) +
       # aes(group = input$stateInput, color = input$stateInput)) +
      ggtitle("% population college grads v. % population below poverty ") +
      labs(y = "% below Poverty", x = "% college grads") +
      theme_classic()
  })
}

# Run the application
shinyApp(ui = ui, server = server)