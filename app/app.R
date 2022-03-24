library(shiny)

ui <- fluidPage(
  tabsetPanel(
    id = "dragon_tabs",
    type = "hidden",
    
    tabPanelBody(
      "intro",
      h1("Intro"),
      
      p(
        "You are in a land full of dragons. In front of you, you see two
  caves. In one cave, the dragon is friendly and will share treasure with you.
  The other dragon is greedy and hungry, and will eat you on sight."
      ),
      
      actionButton(
        inputId = "intro_continue",
        label = "Continue"
      )
    ),
    
    tabPanelBody(
      "question",
      
      h1("Question"),
      p("Which cave will you go into ? ( 1 or 2)"),
      
      actionButton(inputId = "cave_01",
                   label = "Cave 1"),
      
      actionButton(inputId = "cave_02",
                   label = "Cave 2")
    ),
    tabPanelBody(
      "consequences",
      
      h1("Consequences"),
      textOutput(outputId = "consequence_text"),
      
      h1("Play again ? "),
      
      actionButton(inputId = "play_again",
                   label = "Play again !"),
      
      actionButton(inputId = "end_game",
                   label = "No, thank you")
    )
  )
  
)

server <- function(input, output, session) {
  
  observeEvent(input$intro_continue, {
    message("Continue button was pressed")
    updateTabsetPanel(session,"dragon_tabs",selected =  "question")
  })
  
  observeEvent(input$cave_01, {
    message("Cave 01 button was pressed")
    updateTabsetPanel(session,"dragon_tabs",selected =  "consequences")
    cave_number(1)
  })
  
  observeEvent(input$cave_02, {
    message("Cave 02 button was pressed")
    updateTabsetPanel(session,"dragon_tabs",selected =  "consequences")
    cave_number(2)
  })
  
  cave_number <- reactiveVal(1) # setting default value
  output$consequence_text <- renderText(consequences(cave_number()))
  
  observeEvent(input$end_game, {
    message("Play again button was pressed")
    stopApp()
  })
  
  observeEvent(input$play_again, {
    message("Play again button was pressed")
    updateTabsetPanel(session,"dragon_tabs",selected =  "intro")
  })
  
  
}

consequences <- function(cave_number) {
  # friendly dragon == match with cave_number
  friendly <-  sample(1:2, 1)
    if (cave_number == friendly) {
      "Congratulations, you have a new dragon friend! "
    } else {
      "Womp womp you've been eaten by a hungry dragon"
    }
}


shinyApp(ui, server)

#' Flowchart
#' Start
#' Introductory text
#' Player chooses a cave
#' Check for a hungry dragon or a friendly dragon
#'  - player wins
#'  - player loses
#' Ask to play again
#'  - if yes, go to start
#'  - else :
#'    -- End
#' End 