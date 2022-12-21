# User-interface definitions

# Define UI frame ----
ui <- fluidPage(
  
  # App title ----
  headerPanel("Midwest Data Analysis"),
  
  # Sidebar panel for inputs ----
  sidebarLayout(
  sidebarPanel(
    
    # Dropdown menu for state selection
    selectInput("stateSelect", h3("Select State"), midwest$state
    ),
    
  ),
  
  # Main panel for displaying outputs ----
  mainPanel(
    plotOutput("scatterPlot"),
    tableOutput("table")
  )
  )
)