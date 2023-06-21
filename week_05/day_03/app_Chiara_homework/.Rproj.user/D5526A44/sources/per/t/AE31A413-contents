library(shiny)
library(tidyverse)
library(bslib)
library(CodeClanData)


all_years <- scottish_exports %>% 
  distinct(year) %>% 
  pull()


ui <- fluidPage(
  
  theme = bs_theme(boothswhath = "morph"),
  
  titlePanel(tags$h1("Scottish exports")),
  
  
  plotOutput("export_plot"),
  
  fluidRow(
    
    column(width = 6,
           selectInput(
             "year_input",
             tags$i("Select year"),
             choices = all_years
           )
           
    )
    
  )
  
  
  
  
  
  
)


server <- function(input, output) {
  
  output$export_plot <- renderPlot({
    
    scottish_exports %>% 
      filter(year == input$year_input) %>% 
      ggplot() +
      aes(x = sector, y = exports, fill = sector) +
      geom_col(show.legend = FALSE) +
      labs(
        x = "\nsectors",
        y = "\nexports per year\n",
        title = "Scottish exports\n"
      ) +
      coord_flip()
    
  })
  
  
}

shinyApp(ui = ui, server = server)