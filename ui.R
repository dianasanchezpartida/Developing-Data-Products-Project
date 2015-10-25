ui.R


# This is the user-interface definition of a Shiny web application.

library(shiny)
library(rCharts)

shinyUI(
    navbarPage("Disasters Database Explorer",
        tabPanel("Plot",
                sidebarPanel(
                    sliderInput("range", 
                        "Range:", 
                        min = 2000, 
                        max = 2015, 
                        value = c(2000, 2015),
                        format="####"),
                    uiOutput("evtypeControls"),
                    actionButton(inputId = "clear_all", label = "Clear selection", icon = icon("check-square")),
                    actionButton(inputId = "select_all", label = "Select all", icon = icon("check-square-o"))
                ),
  
                mainPanel(
                    tabsetPanel(
                        
                        # Data by state
                        tabPanel(p(icon("line-chart"), "Type phenomena"),
                            column(7,
                                plotOutput("populationImpactByState"),
                                plotOutput("economicImpactByState")
                            )

                        ),
                        
                        # Time series data
                        tabPanel(p(icon("line-chart"), "By year"),
                                 h4('Population impact by year', align = "center"),
                                 showOutput("populationImpact", "nvd3"),
                                 h4('Economic impact by year', align = "center"),
                                 showOutput("economicImpact", "nvd3")
                        ),
                        

                        
                        # Data 
                        tabPanel(p(icon("table"), "Data"),
                            dataTableOutput(outputId="table"),
                            downloadButton('downloadData', 'Download')
                        )
                    )
                )
        
        ),
        
        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
            )
        )
    )
)
