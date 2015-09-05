### UI function
shinyUI(pageWithSidebar(
        
        #  setRegions = unique(origDat$Region),
        #  names(setRegions) = setRegions
        
        ###  Application title
        headerPanel("HIV prevalence (UN)"),
        
        ### Sidebar with sliders 
        sidebarPanel(
                # Choose region  - ONLY 2nd one works and displays text; others diplay numeric
                #selectInput(inputId="region", label="Select a region", choices=setRegions),
                uiOutput("regionSelector"),
        
                br(),
        
                # Choose SeriesCode (reflecting question of interest)
                radioButtons(inputId="variable", label="Variable:", 
                             list("HIV prevalence rate" = "prevrate", "Condom use" = "condom", "Knowledge of HIV/AIDS" = "know", 
                                  "School attendance ratio" = "attend"))
        ),
        
        ### Main Panel
        mainPanel(
                
                tabsetPanel(
                        tabPanel("Available Data", htmlOutput("gvis")),
                        tabPanel("Plot", plotOutput("hivplot")),
                        tabPanel("Table", 
                                 h3("Reported HIV prevalence by Year"),
                                 p("(Ages 15-24, genders combined)"), br(),
                                 tableOutput("table")),
                        tabPanel("About", 
                                 p("Analyzing data to determine the effectiveness of interventions by the UN from 1990 - 2015 to halt and reverse the spread of HIV worldwide."), br(),
                                 p("Data was downloaded from ... ")
                                 )
                        
                        )    #tabsetPanel
)      #mainPanel

))