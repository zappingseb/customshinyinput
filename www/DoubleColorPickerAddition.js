// DoubleColorPicker Input Addition
//
// Reactive function handing a warning
// upon color values being too close
//
// https://github.com/zappingseb/customshinyinput
// Author: Sebastian Wolf
// License: MIT


// Function to compare two hex color values
// taken from https://stackoverflow.com/questions/22692134/detect-similar-colours-from-hex-values
function hexColorDelta(hex1, hex2) {
    // get red/green/blue int values of hex1
    var r1 = parseInt(hex1.substring(0, 2), 16);
    var g1 = parseInt(hex1.substring(2, 4), 16);
    var b1 = parseInt(hex1.substring(4, 6), 16);
    // get red/green/blue int values of hex2
    var r2 = parseInt(hex2.substring(0, 2), 16);
    var g2 = parseInt(hex2.substring(2, 4), 16);
    var b2 = parseInt(hex2.substring(4, 6), 16);
    // calculate differences between reds, greens and blues
    var r = 255 - Math.abs(r1 - r2);
    var g = 255 - Math.abs(g1 - g2);
    var b = 255 - Math.abs(b1 - b2);
    // limit differences between 0 and 1
    r /= 255;
    g /= 255;
    b /= 255;
    // 0 means opposit colors, 1 means same colors
    return (r + g + b) / 3;
}

// Function to check a doublecolorpicker
// item by id
function check_doublecolorpicker(id){
  
  // derive an empty array of two inputs with
  // colors
  values = [];
  
  // push the two colors into the array
  $("#"+id).find('input').each(function(item){
  
    values.push($(this).val());
    
  });
  
  // derive the closeness of the two colors
  // delete the # sign by substring(1)
  closeness = hexColorDelta(values[0].substring(1),values[1].substring(1));

  // If the colors are too close, show a warning inside the 
  // id element
  if(closeness>0.8){
    $('#'+id + ' div.warning').show();
  }else{
    $('#'+id + ' div.warning').hide();
  }
}