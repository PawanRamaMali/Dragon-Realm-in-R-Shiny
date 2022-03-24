library(shiny)

ui <- fluidPage(
  h1("Intro"),
  
  p(
    "You are in a land full of dragons. In front of you, you see two
  caves. In onve cave, the dragon is friendly and will share treasure with you.
  The other dragon is greedy and hungry, and will eat you on sight."
  ),
  
  actionButton(
    inputId = "intro_continue",
    label = "Continue"
  ),
  
  h1("Question"),
  p("Which cave will you go into ? ( 1 or 2)"),
  
  actionButton(inputId = "cave_01",
               label = "Cave 1"),
  
  actionButton(inputId = "cave_02",
               label = "Cave 2"),
  
  h1("Consequences"),
  p("Win text, lose text"),
  
  h1("Play again ? "),
  
  actionButton(inputId = "play_again",
               label = "Play again !"),
  
  actionButton(inputId = "end_game",
               label = "No, thank you")
  
)

server <- function(input, output, session) {
  
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