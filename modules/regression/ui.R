regression_ui <- tabPanel("Regression",
         column(4,
                wellPanel(
                  selectInput("xreg", "Independent Variable (x)", choices = numericNames(mpg), selected = numericNames(mpg)[4]),
                  selectInput("yreg", "Dependent Variable (y)", choices = numericNames(mpg), selected = numericNames(mpg)[5]),
                  
                  hr(),
                  tags$button("", id = "saveresid", type = "button", class = "btn action-button", list(icon("save"), "Save Residuals/Fitted"), onclick = "$('#side-nav :contains(\"Sources\")').highlight();")
                  #actionButton("saveresid", "Save Residuals/Fitted", icon = icon("save"))
                )
         ),
         
         column(8,
                tags$b("Parameter Estimates"),
                tableOutput("regtable"),
                
                hr(),
                
                tags$b("Correlation"),
                textOutput("r"),
                textOutput("r2"),
                
                hr(),
                
                tags$b("Plot of Fit"),
                ggvisOutput("regplot"),
                
                hr(),
                
                tags$b("Residual Plots"),
                fluidRow(
                  column(4, 
                         ggvisOutput("resplot1")
                  ),
                  column(4,
                         ggvisOutput("resplot2")
                  ),
                  column(4,
                         ggvisOutput("resplot3")
                  )
                )
         )
)