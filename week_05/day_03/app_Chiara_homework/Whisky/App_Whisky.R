library(shiny)
library(tidyverse)
library(bslib)
library(CodeClanData)


all_region <- whisky %>% 
  distinct(Region) %>% 
  pull()


all_bodies <- whisky %>% 
  distinct(Body) %>% 
  pull()


ui <- fluidPage(
  
  
  theme = bs_theme(bootswatch = "minty"),
  
  titlePanel(tags$h1("Whisky Distilleries")),
  
  
  plotOutput("whisky_plot"),
  
  
  fluidRow(
    
    column(width = 6,
           selectInput("region_input",
                       tags$b("Which region?"),
                       choices = all_region
           )
    ),
    column(width = 6,
           radioButtons("body_input",
                        tags$i("Which body do you choose?"),
                        choices = all_bodies
           )
    )
    
    
  )
  
)


server <- function(input, output) {
  
  
  output$whisky_plot <- renderPlot({
    
    whisky %>% 
      filter(Region == input$region_input) %>% 
      filter(Body == body$body_input) %>% 
      mutate(capacity_thousands = Capacity/1000) %>% 
      ggplot() +
      aes(x = Distillery, y = capacity_thousands, fill = Distillery) +
      geom_col(show.legend = FALSE) +
      coord_flip() +
      labs(
        x = "\ncapacity (1000 units)",
        y = "\nDistilleries\n\n",
        title = "Whisky Distilleries\n"
      )
    
    
    
  })
  
  
  
  
  
  
}

shinyApp(ui = ui, server = server)


