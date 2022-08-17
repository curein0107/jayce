
library(shiny)
library(ggplot2)


ui <- fluidPage(
  titlePanel("R shiny test page"),
  sidebarLayout(selectInput(inputId = "col_name",
                            label = "choose a cloumn:",
                            choices = names(iris)[1:4]),
                mainPanel(verbatimTextOutput(outputId = "myTable"),
                          plotOutput("myPlot"))))


server <- function(input, output) {
  output$myTable <- renderPrint({
    summary(iris %>% dplyr::select(input$col_names))
  })
  output$myPlot <-renderPlot({
    temp <- iris
    temp$idx <- 1:nrow(temp)
    ggplot(temp) + geom_point(aes_string(x="idx", y=input$col_names))
  })}



