#' UI for open books in HiDAP
#' Returns user friendly ui
#' @author Omar Benites
#' @param type type of UI element, deault is a tab in a shinydashboard
#' @param title diaply title name
#' @param name UI TabName
#' @export
#' 

fbopenbooks_ui <- function(type = "tab", title = "List of Fieldbooks", name = "open_fieldbooks"){
  
  shinydashboard::tabItem(tabName = name,
                          h2(title),   
                          
                          box(
                            title = "List of Fieldbooks", status = "primary", solidHeader = TRUE,
                            collapsible = TRUE, width = 12,
                            #tabsetPanel(
                            tabBox(width = 10,
                                   tabPanel("", #begin tabset "CHECK"
                                            fluidRow( 
                                              #
                                             column(width = 12, DT::dataTableOutput('x1'))#,
                                              #column(8, shiny::textOutput("row_print"))
                                              #column(8, shiny::actionButton("refresh", "Refresh Sheet")),
                                              #column(8, shiny::actionButton(inputId = "fbopen_file" ,label = "Open Book"))
                                              
                                            ), #end fluidow
                                            
                                            fluidRow(
                                               HTML('<div style="float: right; margin: 0 15px 18px 0px;">'),
                                               shiny::actionButton("refresh", "Refresh Table", icon("refresh"), 
                                                                   style="color: #fff; background-color: #337ab7; border-color: #2e6da4"
                                                                   ),
                                               shiny::actionButton(inputId = "fbopen_file" ,label = "Open Book", icon("file"),
                                                                   style="color: #fff; background-color: #51a351; border-color: #51a351"
                                                                   ),
                                            HTML('</div>')
                                            )#,
                                            
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