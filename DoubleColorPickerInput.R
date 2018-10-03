#' Function to return a DoubleColorPicker input
#' @param id (\code{character}) A web element ID, shall not contain dashes or underscores or colon
#' @param col_border (\code{character}) A hex code for the border color default value
#' @param col_fill (\code{character}) A hex code for the fill color default value
#' @return An \code{shiny::div} element with two color pickers
#' @author Sebastian Wolf \email{sebastian@@mail-wolf.de}
DoubleColorPickerInput <- function(id="fancycolorpicker", col_border = "#f00", col_fill="#00f"){
  
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
        }}); 
        </script>"
        
      )
  )# HTML
  )#div
  
  }