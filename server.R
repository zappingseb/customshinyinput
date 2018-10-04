# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)



# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Derive the list of colors out 
    # of our custom input element
    color_list <- input$myid

    # Render a barplot with border
    # and fill color set by the colors_df
    barplot(WorldPhones[,input$region]*1000, 
            main=input$region,
            ylab="Number of Telephones",
            xlab="Year",
            col = color_list[["fill"]],
            border = color_list[["border"]],
            lwd=3
            )
  })
}