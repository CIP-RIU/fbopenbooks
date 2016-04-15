#' Server openbooks
#' 
#' @param input shinyserver input 
#' @param output shinyserver output
#' @param session shinyserver session
#' @param values reactive values
#' @author Omar Benites
#' @export

fbopenbooks_server <- function(input,output,session, values){
  
  fb_file_list <- shiny::reactive({
    #fb_file_list <- list.files(getwd(),full.names = TRUE)
    fb_file_list <- list.files(getwd(), full.names = TRUE, pattern = ".xlsx")
    files <- data.frame(fb_file_list)
    names(files) <- "Files_Direction"
    files
  })
  
  output$x1  <-  DT::renderDataTable(
    fb_file_list(), options = list(), selection = c("single"),server=FALSE
  )
  
#   output$row_print = renderPrint({
#     s =  input$x1_rows_selected
#     s <- as.numeric(s)
#     #info  =  input$x1_cell_clicked
#     cars[s,"speed"]
#   })
  
  shiny::observeEvent(input$fbopen_file, {
    
    shiny::withProgress(message = "Opening Fieldbook...",value= 0,
                 {
    index  <-   input$x1_rows_selected
    index <- as.numeric(index)
    table_files <- fb_file_list()#assign the reactive table
    table_files <- table_files[index,"Files_Direction"]
    selected_file <- as.character(table_files)
    print(selected_file)
    shell.exec(selected_file)
    })
    
})
  
  
} 

# 
# shinyServer(function(input, output, session) {
#   
#   output$x1 = DT::renderDataTable(cars, server = FALSE)
#   
#   # highlight selected rows in the scatterplot
#   output$x2 = renderPlot({
#     s = input$x1_rows_selected
#     par(mar = c(4, 4, 1, .1))
#     plot(cars)
#     if (length(s)) points(cars[s, , drop = FALSE], pch = 19, cex = 2)
#   })
#   
#   # server-side processing
#   mtcars2 = mtcars[, 1:8]
#   output$x3 = DT::renderDataTable(mtcars2, server = TRUE)
#   
#   # print the selected indices
#   output$x4 = renderPrint({
#     s = input$x3_rows_selected
#     if (length(s)) {
#       cat('These rows were selected:\n\n')
#       cat(s, sep = ', ')
#     }
#   })
#   
# })