library(shiny)

server <- function(input, output, session) {
  
  options(shiny.maxRequestSize=1000*1024^2)
  eventlog <- reactive({
    
    req(input$file1$datapath)
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    
    
    data <- readr::read_csv(input$file1$datapath)
    # load BPI Challenge 2017 data set ####
    
    
    # change timestamp to date var
    data$starttimestamp = as.POSIXct(data$'Start Timestamp', 
                                     format = "%Y/%m/%d %H:%M:%S")
    
    data$endtimestamp = as.POSIXct(data$'Complete Timestamp', 
                                   format = "%Y/%m/%d %H:%M:%S")
    
    
    
    
    
    
    
    eventlog <- bupaR::activities_to_eventlog(
      data,
      case_id = 'Case_ID',
      activity_id = 'Activity',
      resource_id = 'Resource',
      timestamps = c('starttimestamp', 'endtimestamp')
    )
  })
  
  
  
  
  # process_map ---------------------------------------------------------------
  output$process_map <- renderUI({
    
    tagList(
      
      
      renderGrViz({
        
        eventlog() %>%
          filter_activity_frequency(percentage = 1.0) %>% # show only most frequent activities
          filter_trace_frequency(percentage = .80) %>%  
          processmapR::process_map()
        
      })
    )
  })
  
  
  
}
