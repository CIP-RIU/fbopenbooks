library(shiny)
library(DT)
library(shinydashboard)

tabNameS <- "open_fieldbooks"

server <- function(input, output, session,values) {
  values = shiny::reactiveValues()
  fbopenbooks::fbopenbooks_server(input, output, session, values = values)
}

ui <- dashboardPage(skin = "yellow",
                    dashboardHeader(title = "Open Fieldbook"),
                    dashboardSidebar(width = 200,
                                     menuItem("Resources",
                                              sidebarMenu(id = "menu",
                                                          menuSubItem("Open Fieldbook", icon = icon("star"),
                                                                      tabName = tabNameS)
                                              )
                                     )
                    ),
                    dashboardBody(
                      
                      tabItems(
                        fbopenbooks::fbopenbooks_ui(name = tabNameS)
                      )
                    )
)

shinyApp(ui = ui, server = server)