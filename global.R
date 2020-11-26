## golab.R ##

#population = read.csv('population.csv', check.names = FALSE)
GDP = read.csv('GDP.csv', check.names = FALSE)
GDP2 = read.csv('GDP2.csv', check.names = FALSE)
unemployment = read.csv('Unemployment.csv', check.names = FALSE)
poverty = read.csv('poverty.csv', check.names = FALSE)

choice_year = colnames(GDP[,-1])
choice_state = rownames(state.x77)

