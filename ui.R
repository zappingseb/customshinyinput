# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
source("custom_input.R")

# Use a fluid Bootstrap layout
fluidPage(    
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "spectrum.css"),
    tags$script(src="spectrum.js")
  ),
  
  # Give the page a title
  titlePanel("Telephones by region"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("region", "Region:", 
                  choices=colnames(WorldPhones)),
      hr(),
      helpText("Data from AT&T (1961) The World's Telephones."),
      DoubleColorPickerInput()
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)