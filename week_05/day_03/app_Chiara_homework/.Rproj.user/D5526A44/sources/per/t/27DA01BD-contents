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

all_sweetnesses <- whisky %>% 
  distinct(Sweetness) %>% 
  pull()

all_smoky <- whisky %>% 
  distinct(Smoky) %>% 
  pull()



ui <- fluidPage(
  
  
  theme = bs_theme(bootswatch = "morph"),
  
  titlePanel(tags$h1("Whisky Distilleries")),
  
  br(),
  
  sidebarLayout(
    sidebarPanel(
      
      #fluidRow(
      #column(width = 4,
      selectInput("region_input",
                  tags$i("Select a Region"),
                  choices = all_region
      )
      # )
    ),
    mainPanel(
      
      column(width = 11,
             plotOutput("whisky_plot"),
      )
      
    )
  ),
  
  
  br(),
  
  
  fluidRow(
    column(width = 4,
           radioButtons("body_input",
                        tags$i("Body:"),
                        choices = all_bodies
           )
    ),
    
    
    column(width = 4,
           radioButtons("sweetness_input",
                        tags$i("Sweetness:"),
                        choices = all_sweetnesses
           )
    ),
    
    column(width = 4,
           radioButtons("smoky_input",
                        tags$i("Smoky:"),
                        choices = all_smoky
           )
    )
    
    
  )
  
)


server <- function(input, output) {
  
  
  output$whisky_plot <- renderPlot({
    
    whisky %>% 
      filter(Region == input$region_input) %>% 
      filter(Body == input$body_input) %>% 
      filter(Sweetness == input$sweetness_input) %>% 
      filter(Smoky == input$smoky_input) %>% 
      mutate(capacity_thousands = Capacity/1000) %>% 
      ggplot() +
      aes(x = Distillery, y = capacity_thousands, fill = Distillery) +
      geom_col(show.legend = FALSE) +
      coord_flip() +
      labs(
        x = "\nDistilleries\n\n",
        y = "\ncapacity (1000 units)",
        title = "Whisky Distilleries\n"
      )
    
    
    
  })
  
  
  
  
  
  
}

shinyApp(ui = ui, server = server)


