library(shiny)
library(ggplot2)
setwd('C:/Users/mazur/OneDrive/Dokumenty/GitHub/Matematyka_dla_przemyslu/gaussiann_plume_model')

ui <- fluidPage(
  titlePanel('wykresik'),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId='n',
                  label = 'Liczba dni',
                  min=1,max=7,step=1,
                  value=1)
    ),mainPanel(
      plotOutput(outputId ='wykres1')
    )
  )
)
server <- function(input, output){
  output$wykres1 <- renderImage({
    filename <- normalizePath(file.path('./model_plots/2D_time_changes',
                                        paste('day', input$n, '_plot.jpg')))
    list(src = filename,
         alt = paste("Image number", input$n),
         width = 600,
         height = 400)
    
  }, deleteFile = FALSE)
}

shinyApp(ui, server)
