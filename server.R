## server.R ##

library(googleVis)
library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)

shinyServer(function(input, output){
  
  ####   output maps ####
  output$map <- renderGvis({
    gvisGeoChart(GDP, "state.name", input$selected,
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              width="auto", height="auto"))
  })
  
  output$map1 <- renderGvis({
    gvisGeoChart(poverty, "state.name", input$selected,
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              width="auto", height="auto",colors = '#FF5733'))
    
  })
  
  output$map2 <- renderGvis({
    gvisGeoChart(unemployment, "state.name", input$selected,
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
                              width="auto", height="auto", colors = '#D35400'))
   
  })
  
  
  #### output bar charts ####
  output$bar <- renderGvis({
    ### creating chart
    gvisBarChart(GDP, xvar="state.name", yvar= input$selected,
                 options=list(fontSize = 9 , width="auto", height="800",title='GDP/Capita in Million $ (Chained 2012)',
                              titleTextStyle="{color:'black',fontName:'sans-serif',fontSize:12}",
                              bar="{groupWidth:'60%'}"))
  })
  
  output$bar1 <- renderGvis({
    ### creating chart
    gvisBarChart(poverty, xvar="state.name", yvar= input$selected,
                 options=list(fontSize = 9 , width="auto", height="800",title='% of people in poverty',
                              titleTextStyle="{color:'black',fontName:'sans-serif',fontSize:12}",
                              bar="{groupWidth:'60%'}"))
  })
  
  output$bar2 <- renderGvis({
   
    ### creating chart
    gvisBarChart(unemployment, xvar="state.name", yvar= input$selected,
                 options=list(fontSize = 9 , width="auto", height="800",title='% of unemployment',
                              titleTextStyle="{color:'black',fontName:'sans-serif',fontSize:12}",
                              bar="{groupWidth:'60%'}"))
  })
  
  
  
  #### output line charts ####
  output$line <- renderGvis({
    
    ### creating data frames to use in time series plots
    GDP_val= GDP %>% filter(.,GDP$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'GDP')
    GDP_val1= GDP_val[-1,]
    GDP_val1[, 2] <- sapply(GDP_val1[, 2], as.numeric)
    
    pov_val= poverty %>% filter(.,poverty$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'poverty')
    pov_val1= pov_val[-1,]
    pov_val1[, 2] <- sapply(pov_val1[, 2], as.numeric)
    
    unemp_val= unemployment %>% filter(.,unemployment$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'unemployment')
    unemp_val1= unemp_val[-1,]
    unemp_val1[, 2] <- sapply(unemp_val1[, 2], as.numeric)
    
    binded_tables = cbind (GDP_val1,pov_val1[,2],unemp_val1[,2])
    names(binded_tables) = c('Year', 'GDP', 'Poverty', 'Unemployment') 
   
    ### creating chart
    gvisLineChart(binded_tables, "Year", c("GDP","Poverty"),
                  options=list(
                    series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
                    vAxes="[{title:'GDP/Capita in million $'}, {title:'Poverty %'}]"
                  ))
   
  })
  
  output$line1 <- renderGvis({
    
    ### creating data frames to use in time series plots
    GDP_val= GDP %>% filter(.,GDP$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'GDP')
    GDP_val1= GDP_val[-1,]
    GDP_val1[, 2] <- sapply(GDP_val1[, 2], as.numeric)
    
    pov_val= poverty %>% filter(.,poverty$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'poverty')
    pov_val1= pov_val[-1,]
    pov_val1[, 2] <- sapply(pov_val1[, 2], as.numeric)
    
    unemp_val= unemployment %>% filter(.,unemployment$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'unemployment')
    unemp_val1= unemp_val[-1,]
    unemp_val1[, 2] <- sapply(unemp_val1[, 2], as.numeric)
    
    binded_tables = cbind (GDP_val1,pov_val1[,2],unemp_val1[,2])
    names(binded_tables) = c('Year', 'GDP', 'Poverty', 'Unemployment') 
    
    ### creating chart
    gvisLineChart(binded_tables, "Year", c("GDP","Unemployment"),
                  options=list(
                    series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
                    vAxes="[{title:'GDP/Capita in million $'}, {title:'Unemployment %'}]"
                  ))
    
  })
  
  output$line2 <- renderGvis({
    
    ### creating data frames to use in time series plots
    GDP_val= GDP %>% filter(.,GDP$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'GDP')
    GDP_val1= GDP_val[-1,]
    GDP_val1[, 2] <- sapply(GDP_val1[, 2], as.numeric)
    
    pov_val= poverty %>% filter(.,poverty$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'poverty')
    pov_val1= pov_val[-1,]
    pov_val1[, 2] <- sapply(pov_val1[, 2], as.numeric)
    
    unemp_val= unemployment %>% filter(.,unemployment$state.name == input$selected2 ) %>% gather(.,key = 'year', value = 'unemployment')
    unemp_val1= unemp_val[-1,]
    unemp_val1[, 2] <- sapply(unemp_val1[, 2], as.numeric)
    
    binded_tables = cbind (GDP_val1,pov_val1[,2],unemp_val1[,2])
    names(binded_tables) = c('Year', 'GDP', 'Poverty', 'Unemployment') 
    
    ### creating chart
    gvisLineChart(binded_tables, "Year", c("Unemployment","Poverty"),
                  options=list(
                    series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
                    vAxes="[{title:'Unemployment %'}, {title:'Poverty %'}]"
                  ))
    
  })
  ### Creating infoboxes
  
  #### GDP
  output$maxBox <- renderInfoBox({
    max_value <- max(GDP[,input$selected])
    max_state <- 
      GDP$state.name[GDP[,input$selected]==max_value]
    infoBox(max_state, max_value, icon = icon("sort-amount-up"))
  })
  output$minBox <- renderInfoBox({
    min_value <- min(GDP[,input$selected])
    min_state <- 
      GDP$state.name[GDP[,input$selected]==min_value]
    infoBox(min_state, min_value, icon = icon("sort-amount-up-alt"))
  })
  output$avgBox <- renderInfoBox(
    infoBox(paste("Median of the year ", input$selected),
            median(GDP[,input$selected]), 
            icon = icon("medium-m")))
  
  #### poverty
  output$maxBox1 <- renderInfoBox({
    max_value <- max(poverty[,input$selected])
    max_state <- 
      poverty$state.name[poverty[,input$selected]==max_value]
    infoBox(max_state, max_value, icon = icon("sort-amount-up"))
  })
  output$minBox1 <- renderInfoBox({
    min_value <- min(poverty[,input$selected])
    min_state <- 
      poverty$state.name[poverty[,input$selected]==min_value]
    infoBox(min_state, min_value, icon = icon("sort-amount-up-alt"))
  })
  output$avgBox1 <- renderInfoBox(
    infoBox(paste("Median of the year ", input$selected),
            median(poverty[,input$selected]), 
            icon = icon("medium-m")))
  
  #### unemployment
  output$maxBox2 <- renderInfoBox({
    max_value <- max(unemployment[,input$selected])
    max_state <- 
      unemployment$state.name[unemployment[,input$selected]==max_value]
    infoBox(max_state, max_value, icon = icon("sort-amount-up"))
  })
  output$minBox2 <- renderInfoBox({
    min_value <- min(unemployment[,input$selected])
    min_state <- 
      unemployment$state.name[unemployment[,input$selected]==min_value]
    infoBox(min_state, min_value, icon = icon("sort-amount-up-alt"))
  })
  output$avgBox2 <- renderInfoBox(
    infoBox(paste("Median of the year ", input$selected),
            median(unemployment[,input$selected]), 
            icon = icon("medium-m")))
  
  
})