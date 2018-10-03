// DoubleColorPicker Input Binding
//
// Definition of a Shiny InputBinding extension to
// get the values of two color pickers.
//
// https://github.com/zappingseb/customshinyinput
// Author: Sebastian Wolf
// License: MIT

// -----------------------------------------------------

// Create a shiny input binding
// Each custom input needs to be a shiny input binding
// that is defined by the JavaScript class "Shiny" and
// using the method "InputBinding"
// The name can be chosen, here it is "DoubleColorPickerBinding"
var DoubleColorPickerBinding = new Shiny.InputBinding();

// Extend the binding with the functions seen here
$.extend(DoubleColorPickerBinding, {
  
  // The scope defines how the element is described in HTML code
  // The best way to find the scope 
  find: function(scope) {
    return $(scope).find(".doublecolorpicker");
  },
  getValue: function(el) {
    // create an empty output array
    var output = []
  
    // go over each input element inside the
    // defined InputBinding and add the ID
    // and the value as a dictionary to the output
    $(el).find("input").each(function(inputitem){
  
      output.push({
          name:   $(this).attr("id"),
          value:  $(this).val()
      });
    });
  
    // return the output as JSON 
    return(JSON.stringify(output))

  },
  setValue: function(el, value) {
   // todo
  },
  subscribe: function(el, callback) {
    // the jQuery "change" function allows you
    // to notice any change to your input elements
  	$(el).on('change.input', function(event) {
  	  callback(false);
  	});	
  },
  unsubscribe: function(el) {
    $(el).off('.doublecolorpicker');
  }
});

// Registering the shiny input
//
// The following function call is used to tell shiny that
// there now is a new Shiny.InputBinding that it shall
// deal with and that it's functionality can be found in
// the variable "DoubleColorPickerBinding"
Shiny.inputBindings.register(DoubleColorPickerBinding);