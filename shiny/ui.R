library(shiny)
library(shinydashboard)

dashboardPage(skin="red",
    dashboardHeader(title = "Inégalités des revenus dans le Monde"),
    dashboardSidebar( 
        sidebarMenu(
          menuItem("Accueil", tabName = "stats", icon = icon("th")),
          menuItem("Comparaison de region", tabName = "graphiques",icon = icon("chart-bar"))
           
            
        ),
      varSelectInput("indicateur", label = "Indicateur :",
                  final_dataset[3:10], plotOutput("region1")),
      sliderInput("year", label = h3("Années"), min = 1980, 
                  max = 2019, value = c(1980, 2019)),
      selectInput("region1", label = "Région 1 :",
                final_dataset['region'], plotOutput("region1")),
      selectInput("region2", label = "Région 2 :",
                  final_dataset['region'], plotOutput("region2"))
    ),
    
    dashboardBody(
        tabItems(
          tabItem(tabName = "stats",
                  fluidRow(
                    valueBox(8 , "Nombre de regions", icon = icon("globe-europe")),
                    
                    infoBox("Nombre d'années", 40, icon = icon("calendar"), color="purple"),
                    
                  ),
          ),
          tabItem(tabName = "graphiques",
                  h2("Comparaison de 2 régions"),
                  fluidRow(
                    box(title = "Distribution of color", status = "warning"
                        ,plotOutput("plot2", height = 300)),
                    
                    box(title = "Distribution of color", status = "warning"
                        ,plotOutput("plot3", height = 300))
                    
                  )
          )
        )
        
    )
)
