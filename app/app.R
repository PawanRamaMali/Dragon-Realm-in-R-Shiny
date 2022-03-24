library(shiny)

ui <- fluidPage(
  
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