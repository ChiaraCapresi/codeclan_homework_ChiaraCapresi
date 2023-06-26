library(shiny)
library(tidyverse)
library(CodeClanData)
library(bslib)


years <- game_sales %>% 
  distinct(year_of_release) %>% 
  pull()


genres <- game_sales %>% 
  distinct(genre) %>% 
  pull()

all_developers <- game_sales %>% 
  distinct(developer) %>% 
  pull()



ui <- fluidPage(
  
  
  #theme = bs_theme(bootswatch = "morph"),
  
  titlePanel(tags$h1("Game Sales")),
  
  
  tabsetPanel(
    
    
    tabPanel("Best Game per genre and year",
             
             fluidRow(
               
               sidebarLayout(
                 
                 sidebarPanel(
                   
                   selectInput(
                     "year_input",
                     "Year of release?",
                     choices = years
                   ),
                   
                   selectInput(
                     "genre_input",
                     "Select genre",
                     choices = genres
                   )
                   
                 ),
                 
                 mainPanel(
                   plotOutput("game_plot")
                 )
                 )
                 
               ),
               
             HTML("<br><br><br>"),
             
             
             
             fluidRow(
               textOutput("tx1"),
             )
             
             
             
    ),
    
    
    
    
    tabPanel("Best Game per genre, year and developer",
             
             fluidRow(
               
               sidebarLayout(
                 
                 sidebarPanel(
                   
                   selectInput(
                     "year_input_2",
                     "Year of release?",
                     choices = years,
                     selected = 2006
                   ),
                   
                   selectInput(
                     "genre_input_2",
                     "Select genre",
                     choices = genres,
                     selected = "Sports"
                   ),
                   
                   selectInput("developer_input",
                              "Choose developer",
                              choices = all_developers,
                              selected = "EA"
                              )
                   
                 ),
                 
                 mainPanel(
                   plotOutput("game_plot_2")
                 )
               )
               
             ),
             
             
             HTML("<br><br><br>"),
             
             fluidRow(
               textOutput("tx2"),
             )
             
             
             
    ),
    
    
    
    
    
    
    
    
    
    tabPanel("Data",
             
             DT::dataTableOutput("table_output")
    )
    
    
    
    
    
    
    
  )
)


server <- function(input, output, session) {
  
  
  filtered_game_sales <- reactive({
    game_sales %>% 
      filter(year_of_release == input$year_input) %>% 
      filter(genre == input$genre_input)
  })
  
  
  
  filtered_game_sales_2 <- reactive({
    game_sales %>% 
      filter(year_of_release == input$year_input_2) %>% 
      filter(genre == input$genre_input_2) %>% 
      filter(developer == input$developer_input)
  })
  
  
  output$game_plot <- renderPlot({
    filtered_game_sales() %>% 
      ggplot() +
      aes(x = name, y = user_score, fill = developer) +
      geom_col() +
      coord_flip()
  })
  
  
  
  output$game_plot_2 <- renderPlot({
    filtered_game_sales_2() %>%
      ggplot() +
      aes(x = name, y = user_score, fill = developer) +
      geom_col(show.legend = FALSE) +
      coord_flip()
  })
  
  
  
  output$tx1 <- renderText(
    "This chart represents, for each year and genre selected, the sales of each game released that year. 
    The games developed by the same company has the same colour."
  )
  
  
  output$tx2 <- renderText(
    "This chart represents, for each year, genre and developer selected, the sales of each game released that year."
  )
  
  
  
  
  output$table_output <- DT::renderDataTable({
    game_sales
  })
  
  
}

shinyApp(ui, server)