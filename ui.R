# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)
library(glue)

# jsonlite is used to derive data from custom JavaScript inputs
library(jsonlite)

source("DoubleColorPickerInput.R")

# Use a fluid Bootstrap layout
fluidPage(    
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "spectrum.css"),
    tags$script(src="spectrum.js"),
    # Import our own JavaScript file for custom Shiny input bindings
    tags$script(src="DoubleColorPickerInput.js"),
    
    # Import our own JavaScirpt that allows to add a warning
    # to the shiny inputs
    tags$script(src="DoubleColorPickerAddition.js")
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
      # Create a DoubleColorPicker Input
      DoubleColorPickerInput(id="myid")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)