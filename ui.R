## ui.R ##

library(shinydashboard)

shinyUI(dashboardPage(
  dashboardHeader(title = 'Mini Econometer :)'),
  dashboardSidebar(
    sidebarUserPanel('Almas', image = 'data:image/png;base64,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'),
    sidebarMenu(
      menuItem("Map", tabName = "map", icon = icon("map")),
      menuItem("Time_series", tabName = "Time_series", icon = icon("chart-line")))

  ),
  dashboardBody(
    
    
    tabItems(tabItem(tabName = "map",
                     
                     fluidRow (box(background = "navy", width = 4, selectizeInput("selected",
                                                                         " Year ",
                                                                         choice_year))),
                     fluidRow(
                       box(title='Real GDP/Capita in Million $ (Chained $ 2012)',htmlOutput("map"), width = 4),
                       box(title ='% of people in poverty',htmlOutput("map1"),width = 4),
                       box(title ='% of unemployment',htmlOutput("map2"), width = 4)
                     ),
                     
                     fluidRow(
                      width = 4,
                              box(title = 'GDP vs. Unemployment Correlation' , width = 4, infoBoxOutput("corrBox", width = 12)),
                              box(title = 'GDP vs. Poverty Correlation' , width = 4, infoBoxOutput("corrBox1", width = 12)),
                              box(title = 'Unemployment vs. Poverty Correlation' , width = 4, infoBoxOutput("corrBox2", width = 12))
                      
                     ),
                     
                     fluidRow(
                       
                       column( width = 4,
                              box(title = 'GDP/Capita in million $' , width = NULL, infoBoxOutput("maxBox", width = 12)),
                              box(width = NULL, infoBoxOutput("minBox", width = 12)),
                              box(width = NULL, infoBoxOutput("avgBox", width = 12))
                       ),
                       column( width = 4,
                               box(title = '% of people in poverty' , width = NULL, infoBoxOutput("maxBox1", width = 12)),
                               box(width = NULL, infoBoxOutput("minBox1", width = 12)),
                               box(width = NULL, infoBoxOutput("avgBox1", width = 12))
                       ),
                       column( width = 4,
                               box(title = '% of unemployment' , width = NULL, infoBoxOutput("maxBox2", width = 12)),
                               box(width = NULL, infoBoxOutput("minBox2", width = 12)),
                               box(width = NULL, infoBoxOutput("avgBox2", width = 12))
                       )
                       
                       ),
                     
                     fluidRow(
                              # box(htmlOutput("bar")),
                              box(htmlOutput("bar"),width = 4),
                              box(htmlOutput("bar1"),width = 4),
                              box(htmlOutput("bar2"),width = 4))),
             
             
             tabItem(tabName = "Time_series",
                     fluidRow(
                       box(width = 4, background = 'navy', selectizeInput("selected2",
                                                      "State",
                                                      choice_state))
                     ),
                     
                     fluidRow(
                       width = 4,
                       box(title = 'GDP vs. Poverty Correlation' , width = 4, infoBoxOutput("corrBox3", width = 12)),
                       box(title = 'GDP vs. Unemployment Correlation' , width = 4, infoBoxOutput("corrBox4", width = 12)),
                       box(title = 'Unemployment vs. Poverty Correlation' , width = 4, infoBoxOutput("corrBox5", width = 12))
                     ),
                     
                     fluidRow(
                              box(title='GDP vs. Poverty',htmlOutput("line"), width = 12),
                              box(title='GDP vs. Unemployment',htmlOutput("line1"), width = 12),
                              box(title='Unemployment vs. Poverty',htmlOutput("line2"), width = 12)
                              ),
                     fluidRow(
                       # box(htmlOutput("bar")),
                       box(htmlOutput("bar3"),width = 4),
                       box(htmlOutput("bar4"),width = 4),
                       box(htmlOutput("bar5"),width = 4)
                       )
      
                     )
             )
    
  )
))