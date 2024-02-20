#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(GenomicRanges)
library(Gviz)
library(shiny)

data(geneModels)

ui <- fluidPage(
  
  titlePanel("Gene Models"),
  
  sidebarLayout(
    sidebarPanel(
      tagList(
        span("The geneModels data contains", nrow(geneModels), "observations on", ncol(geneModels), "variables."),
        shiny::tags$br(),
        shiny::tags$br(),
      ),
      
      selectInput("feat",
        "Filter on feature:",
        choices = unique(geneModels$feature),
        multiple = TRUE)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("table")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  dataFiltered <- reactive({
    
    if (!is.null(input$feat)) {
      geneModels[geneModels$feature %in% input$feat, ]
    } else {
      geneModels
    }
    })
  
  output$table <- renderTable({
    
    dataFiltered()[order(dataFiltered()$feature),]
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
