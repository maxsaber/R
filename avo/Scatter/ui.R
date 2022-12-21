# User-interface definitions

# Define UI frame
ui <- fluidPage(
  
  # Shiny app title
  headerPanel("Midwest Data Analysis"),
  
  # Sidebar panel for input selects
  sidebarLayout(
    sidebarPanel(
      
      # Drop down menu for state selection
      selectInput("stateSelect", h3("Select State"), midwest$state
      ),
      
    ),
  
  # Main panel for displaying output
    mainPanel(
      plotOutput("scatterPlot")
    )
  
  )
  
)