library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(

  # App title ----
  titlePanel("Uploading Files"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
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
))
