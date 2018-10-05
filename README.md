# 7 easy steps to custom inputs in shiny

This is the outcome shiny application out of a
[tutorial](https://medium.com/@zappingseb/7-steps-that-make-custom-inputs-in-shiny-easy-504b303a2973) that tells you how to build this application.

The shiny app will include custom inputs that are
two color pickers. Those color pickers will be handed
over to shiny as one single value. The value
will be parsed into a list.

Finally the colors will be used to color a 
barplot.

To see the whole tutorial check the [Medium link](https://medium.com/@zappingseb/7-steps-that-make-custom-inputs-in-shiny-easy-504b303a2973)

## Run the app

derive all dependencies by

```
install.packages(c("shiny","jsonlite","datasets","glue"))
```

and run the application

```
runApp()
```

## References

* [Tutorial link - 7 easy steps to custom inputs in shiny](https://medium.com/@zappingseb/7-steps-that-make-custom-inputs-in-shiny-easy-504b303a2973)
* [spectrum.js](https://bgrins.github.io/spectrum/)
* [Building shiny inputs](https://shiny.rstudio.com/articles/building-inputs.html)
