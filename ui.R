#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles Per Gallon"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for variable to plot against mpg ----
      selectInput("variable", "Variable:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am",
                    "Gears" = "gear")),
      
      # Input: Checkbox for whether outliers should be included ----
      checkboxInput("outliers", "Show outliers", TRUE)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      tabsetPanel(
        tabPanel("Output",
                 h3(textOutput("caption")), # Output: Formatted text for caption ----
                 plotOutput("mpgPlot") # Output: Plot of the requested variable against mpg ----
        ),
        tabPanel("Documentation",
                 p(h3("Introduction")),
                 helpText("The application we'll be building uses the mtcars data from the R datasets package, and allows users to see a box-plot that explores the relationship between miles-per-gallon (MPG) and three other variables (Cylinders, Transmission, and Gears)."),
                 helpText("We want to provide a way to select which variable to plot MPG against as well as provide an option to include or exclude outliers from the plot. To do this we'll add two elements to the sidebar, a selectInput to specify the variable and a checkboxInput to control display of outliers. Our user-interface definition looks like this after adding these elements:")
                 
        )
      )
    )
  )
))