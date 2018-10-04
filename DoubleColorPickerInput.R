#' Function to return a DoubleColorPicker input
#' @param id (\code{character}) A web element ID, shall not contain dashes or underscores or colon
#' @param col_border (\code{character}) A hex code for the border color default value
#' @param col_fill (\code{character}) A hex code for the fill color default value
#' @return An \code{shiny::div} element with two color pickers
#' @author Sebastian Wolf \email{sebastian@@mail-wolf.de}
DoubleColorPickerInput <- function(id="fancycolorpicker", col_border = "#f00000", col_fill="#00000f"){
  
  # Return a div element of class "doubleclorpicker"
  div(
    id=id,
    class="doublecolorpicker",
    
    # Include two shiny textInputs
    textInput(inputId=glue("{id}-input-border"),label="Border Color",value = col_border),
    tags$label("Fill Color"),
    HTML(glue("<input type='text' id='{id}-input-fill' value='{col_fill}'/>")),
    
    # Include the Javascript code given by the spectrum.js website
    HTML(
      glue(
        "<script>
        $('#{id}-input-border').spectrum({{
        color: '{col_border}',
        preferredFormat: 'hex'
        }});
        $('#{id}-input-fill').spectrum({{
        color: '{col_fill}',
        preferredFormat: 'hex'
        }});</script>"
      )
    ),# HTML
    
    # Code to give a warning upon colors being too close
    HTML(glue("<script>$('#{id}').on('change',function(){{check_doublecolorpicker('{id}');}});</script>")),
    HTML("<div class='warning' style='color:red;display:none'>Please choose more different colors</div>")
  )#div
  
}


# Try to remove the input Handler as shiny does not allow double input
# handlers
try({ removeInputHandler("DoubleColorPickerBinding") })

# Use the shiny registerInputHandler function to
# register a way to deal with the inputs coming
shiny::registerInputHandler(
  "DoubleColorPickerBinding", 
  function(x, shinysession, name) {
    
    if(is.null(x)) {
      return(x)
      
    } else {
      # Parse return value from JSON into R format dataframe
      colors_df <- jsonlite::fromJSON(x)
      
      # Extract the values of the data frame as a list
      res <- list()  
    
      res[["fill"]] <- colors_df$value[
        which(grepl(colors_df$name,pattern="fill"))
        ]
      res[["border"]] <- colors_df$value[
        which(grepl(colors_df$name,pattern="border"))
        ]
      
      return(res)
    }
  }
)