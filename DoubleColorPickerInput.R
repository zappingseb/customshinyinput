#' Function to return a DoubleColorPicker input
#' @param id (\code{character}) A web element ID, shall not contain dashes or underscores or colon
#' @param col_border (\code{character}) A hex code for the border color default value
#' @param col_fill (\code{character}) A hex code for the fill color default value
#' @return An \code{shiny::div} element with two color pickers
#' @author Sebastian Wolf \email{zappingseb@@gmail.com}
DoubleColorPickerInput <- function(id="fanycolorpicker", col_border = "#f00", col_fill="#00f"){
  
  # Return a div element of class "doubleclorpicker"
  div(
    id=id,
    class="doublecolorpicker",
    
    # Include two shiny textInputs
    textInput(inputId=glue("{id}-input-border"),label="Border Color"),
    tags$label("Fill Color"),
    HTML(glue("<input type='text' id='{id}-input-fill'/>")),
    
    # Include the Javascript code given by the spectrum.js website
    HTML(
      glue(
        "<script>
          $('#{id}-input-border').spectrum({{
            color: '{col_border}'
          }});
          $('#{id}-input-fill').spectrum({{
                    color: '{col_fill}'
          }}); 
          </script>"
        
      )
    )# HTML
  )#div
  
}