tabPanel("Source",
         value = "Build",
         fluidPage(fluidRow(column(4,
                                   div(
                                     h5("Import your data file"),
                                     br()
                                   ))),
                   fluidRow(column(
                     3,
                     
                     ####BS Modals
                     bsModal(
                       "importdata",
                       "Import data",
                       "go_importdata",
                       size = "small",
                       selectInput(
                         "DataBase.Type",
                         "Data Base Type",
                         c(
                           "Tabular",
                           "Json"
                         ),
                         selected = "Tabular"
                       ),
                       conditionalPanel(
                         "input['DataBase.Type']=='Tabular' || input['DataBase.Type']=='Json'",
                         fileInput(
                           'InputFile',
                           h4('Import Data'),
                           accept = c(".csv", ".xlsx", ".xls", ".json"),
                           width = '100%'
                         ),
                         tags$hr(),
                         checkboxInput("header", "Header", TRUE)
                         
                       )

                       
                     ),
                     div(
                       class = "jumbotron",
                       actionButton("go_importdata", "Import"),
                    
                     )
                   ),
                   column(
                     8,
                     tags$div(mainPanel(DTOutput("contents")))
                   ))))