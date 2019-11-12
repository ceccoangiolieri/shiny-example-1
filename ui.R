library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel('Iris k-means clustering'),
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Select a file ----
      fileInput("file1", "Choose CSV File",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv"))
      
    ),
    mainPanel (
      tabPanel(title = "Process map",
               uiOutput("process_map"))
      
    )
  )
)
