# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# jsonlite is used to derive data from custom JavaScript inputs
library(jsonlite)

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Derive a data.frame out of your JSON coming
    # from the custom input
    colors_df <- jsonlite::fromJSON(input$myid)

    # Render a barplot with border
    # and fill color set by the colors_df
    barplot(WorldPhones[,input$region]*1000, 
            main=input$region,
            ylab="Number of Telephones",
            xlab="Year",
            col = colors$value[
              which(grepl(colors$name,pattern="fill"))
            ],
            border = 
              colors$value[
              which(grepl(colors$name,pattern="border"))
              ],
            lwd=3
            )
  })
}