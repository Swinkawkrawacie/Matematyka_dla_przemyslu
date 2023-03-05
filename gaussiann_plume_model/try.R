library(shiny)
library(ggplot2)
ui <- fluidPage(
  titlePanel('wykresik'),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId='a',
                  label = 'sin(ax)',
                  min=0.1,max=10,step=0.1,
                  value=1)
    ),mainPanel(
      plotOutput(outputId ='wykres1')
    )
  )
)
server <- function(input, output){
  output$wykres1 <- renderPlot({
    a <- input$a
    x <- -10:.01:10
    y <- sin(a*x)
    df <- data.frame(x,y)
    ggplot(df,aes(x,y))+geom_line(col='hotpink')
  })
}

shinyApp(ui, server)
