# Part 2: Do this in Shiny. Please turn in an app.R file with the code that you used. 

#10) Create something fun, using your choice of sliders, maps, datasets, buttons, etc. Use at least 
#three user inputs. 5 pt

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
  #9) Write a code that takes any two numbers provided by the user, adds them, and displays the 
  #message “[first number] plus [second number] is [sum]”. 5 pts
  numericInput("obs1", "Value 1", 0), 
  numericInput("obs2", "Value 2", 0),
  # textOutput("answer"),
  verbatimTextOutput("value"),
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("poo"),
                 icon("smile"),
                 icon("face-sad-cry")
               ),
               choiceValues = list("angry", "happy", "sad")
  ),
  mainPanel(
    plotOutput(outputId = "scatterplot", hover = "plot_hover")
  )
  # verbatimTextOutput("info")
)

# Define server logic required to create a reactive plot 
server <- function(input, output) {

# filtered <- reactive({
#   midwest %>% filter(state == input$state)
# })``
  output$scatterplot <- renderPlot({
    #draw scatterplot 
    midwest %>% 
      ggplot(aes(x = percbelowpoverty, y = percollege, color = state)) +
      #aes(x = input$XInput, y = input$YInput)) + 
      geom_point(aes(group = input$stateInput,color = input$stateInput)) +
       # aes(group = input$stateInput, color = input$stateInput)) +
      ggtitle("% population college grads v. % population below poverty ") + 
      labs(y="% below Poverty",x="% college grads") +
      theme_classic() 
  })
  # output$result
  output$value <- renderPrint({ 
  print("The first input plus the second input is equal to"); input$obs1 + input$obs2})
}

# Run the application 
shinyApp(ui = ui, server = server)

#8) Using the ‘midwest’ dataset from ggplot, use ggplot to graph a scatterplot of percent population 
# college graduates vs percent population below poverty. Choose a method in this app to select 
# each state in the dataset individually to display only that state’s data in the graph. Also, create 
# an option in this app to display a subset of the data in a table by clicking, hovering, or drawing a 
# box (choose one) around the points in the graph. 5 pts

# ggplot scatterplot of % population college grads v. % population below poverty 

# scatterplot <- midwest %>% 
#   ggplot(aes(x=percollege,y=percbelowpoverty))

# choose method to display only each state individually 

# create option to to display a subset of data in a table by hovering around points in graph 


    
#   output$deptTableOuput <- renderTable(x <- dept_data())
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2]
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#     
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white',
#          xlab = 'Waiting time to next eruption (in mins)',
#          main = 'Histogram of waiting times')
#   })
# }
# 
# # Run the application 
# shinyApp(ui = ui, server = server)
# hinyServer(function(input, output) {
#   
#   dept_data <- reactive({
#     final_dept_df %>% filter(pd_dept == input$departmentInput,
#                              force_type %in% c(input$forceChoicesInput))
#   })
#   officer_data <- reactive({
#     officer_df %>% filter(pd_dept == input$departmentInput) %>%
#       group_by(Officer_Name2) %>% 
#       summarise(
#         count_incedents = n_distinct(INCIDENTID),
#         count_compliance_hold = sum(label =="compliance_hold"),
#         count_hand_fists = sum(label =="hands_fists"),
#         count_pepper_spray = sum(label == "pepper_spray"),
#         count_baton = sum(label == "baton"),
#         count_take_down = sum(label == "take_down"),
#         count_leg_strikes = sum(label == "leg_strikes"),
#         count_deadly_force = sum(label == "deadly_force")
#       )
#   })
#   output$improvePlotOutput <- renderPlot(
#     ggplot(dept_data()) + 
#       aes(x= period, y = percent,
#           group = force_type, color = force_type) +
#       geom_line() + ggtitle("Use of Force by Category") + theme_bw() +
#       labs(y= "Percent of Incidents", x = "Year Group")
#   )
#   output$deptTableOuput <- renderTable(x <- dept_data())
#   output$officerTableOuput <- renderTable(x <- officer_data())
# })
# 
#   
#   
#   theme = shinytheme("cerulean"),
#                 navbarPage(
#                   theme = "cerulean",
#                 )
#     # Application title
#     titlePanel("ggplot2::midwest dataset"),
# 
#     # Sidebar with a slider input for number of bins 
#     
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("bins",
#                         "Number of bins:",
#                         min = 1,
#                         max = 50,
#                         value = 30)
#         ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#            plotOutput("distPlot")
#         )
#     )
# )
# 
# # Define server logic required to draw a histogram
# server <- function(input, output) {
# 
#     output$distPlot <- renderPlot({
#         # generate bins based on input$bins from ui.R
#         x    <- faithful[, 2]
#         bins <- seq(min(x), max(x), length.out = input$bins + 1)
# 
#         # draw the histogram with the specified number of bins
#         hist(x, breaks = bins, col = 'darkgray', border = 'white',
#              xlab = 'Waiting time to next eruption (in mins)',
#              main = 'Histogram of waiting times')
#     })
# }


