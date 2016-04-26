#' UI for open books in HiDAP
#' Returns user friendly ui
#' @author Omar Benites
#' @param type type of UI element, deault is a tab in a shinydashboard
#' @param title diaply title name
#' @param name UI TabName
#' @export
#' 

fbopenbooks_ui <- function(type = "tab", title = "Open Fieldbooks", name = "open_fieldbooks"){
  
  shinydashboard::tabItem(tabName = name,
                          h2(title),   
                          
                          box(
                            title = "Open Fieldbooks", status = "primary", solidHeader = TRUE,
                            collapsible = TRUE, width = NULL,
                            #tabsetPanel(
                            tabBox(width = 12,
                                   tabPanel("Check", #begin tabset "CHECK"
                                            fluidRow( 
                                              #shinyFiles::shinyFilesButton('file', 'File select', 'Please select a file',FALSE),
                                              #shiny::actionButton("calculate", "Calculate",icon("play-circle-o")),
                                              #HTML('<div style="float: right; margin: 0 5px 5px 10px;">'),
                                              #shiny::actionLink('exportButton', 'Download data'),
                                              #HTML('</div>'),
                                              #box(rHandsontableOutput("hot_btable",height = "1400px",width = "1000px"),
                                              #    height = "3400px",width ="2400px")
                                              
                                              column(6, DT::dataTableOutput('x1')),
                                              #column(8, shiny::textOutput("row_print"))
                                              column(8, shiny::actionButton("refresh", "Refresh Sheet")),
                                              column(8, shiny::actionButton(inputId = "fbopen_file" ,label = "Open Book"))
                                              
                                            )#, end fluidow
                                            
#                                             tags$style(type='text/css', "#file { width:150px; margin-top: 25px;}"),
#                                             tags$style(HTML('#file {background-color:#0099cc; color: #ffffff}')),  
#                                             tags$style(type='text/css', "#calculate { width:150px; margin-top: 25px;}"),
#                                             tags$style(HTML('#calculate {background-color:#21b073; color: #ffffff}'))
                                            
                                   )#,#end tab Panel "CHECK"
                                   
                            )
                          ),
                          br(),
                          br(),
                          br()


  )#End data_processing tabItem
  
}
# library(shiny)
# 
# fluidPage(
#   
#   title = 'Select Table Rows',
#   
#   h1('A Client-side Table'),
#   
#   fluidRow(
#     column(6, DT::dataTableOutput('x1')),
#     column(6, plotOutput('x2', height = 500))
#   ),
#   
#   hr(),
#   
#   h1('A Server-side Table'),
#   
#   fluidRow(
#     column(9, DT::dataTableOutput('x3')),
#     column(3, verbatimTextOutput('x4'))
#   )
#   
# )