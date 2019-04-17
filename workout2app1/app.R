#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)

#' @title future value
#' @description computes the future value of an investment 
#' @param amount initial invested amount (numeric)
#' @param rate annual rate of return (numeric)
#' @param years number of years (numeric)
#' @return computed future value
future_value <- function(amount, rate, years) {
  amount * ((1 + rate)^years)
}
#' @title future value of annuity
#' @description computes the future value of annuity
#' @param contrib contributed amount (numeric)
#' @param rate annual rate of return (numeric)
#' @param years number of years (numeric)
#' @return computed future value of annuity

annuity<- function(contrib, rate, years) {
  contrib * ((((1 + rate) ^ years) - 1) / rate)
}

#' @title future value of growing annuity
#' @description computes the future value of growing annuity
#' @param contrib contributed amount (numeric)
#' @param rate annual rate of return (numeric)
#' @param growth annual growth rate (numeric)
#' @param years number of years (numeric)
#' @return computed future value of growing annuity

growing_annuity <- function(contrib, rate, growth, years) {
  contrib * ((((1 + rate) ^ years) - ((1 + growth) ^ years)) / (rate - growth))
}

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Saving Modalities"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     column(4,
         sliderInput("amount",
                     label = "Initial Amount:",
                     min = 1,
                     max = 100000,
                     step = 500, 
                     value = 1000)
      ),
     column(4,
            sliderInput("rate",
                        label = "Return Rate (in %):",
                        min = 0,
                        max = 20,
                        step = 0.1,
                        value = 5)
     ),
     column(4,
            sliderInput("years",
                        label = "Years:",
                        min = 0,
                        max = 50,
                        step = 1,
                        value = 20)
     ),
     column(4,
            sliderInput("contrib",
                  label = "Annual Contribution:",
                  min = 0,
                  max = 50000,
                  step = 500,
                  value = 2000)
   ),
   column(4,
          sliderInput("growth",
                      label = "Growth Rate (in %):",
                      min = 0,
                      max = 20,
                      step = 0.1,
                      value = 2)
   ),
   column(4,
          selectInput("fct",
                      "Facet?",
                      c("No", "Yes"))
          ),
   
      
      # Show a plot of the generated distribution
      mainPanel(
        h4("Timelines"),
         plotOutput("distPlot"),
        h4("Balances"),
         tableOutput("modals")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  #creates reactive function to access dataframe throughout the app
  modals <- reactive({
    
    modals <- data.frame(year = 0:input$years, no_contrib = rep(input$amount, input$years +1),
                             fixed_contrib = rep(input$amount, input$years+1),
                             growing_contrib = rep(input$amount, input$years+1))
    amount <- input$amount
    contrib <- input$contrib
    rate <- input$rate * 0.01
    years <- 1:input$years
    growth <- input$growth * 0.01
    no_contrib = c()
    no_contrib[1] = input$rate
    
    for(yr in years) {
      no_contrib = future_value(amount, rate, yr)
      modals$no_contrib[yr +1] = no_contrib
      
      fixed_contrib = annuity(contrib, rate, yr)
      modals$fixed_contrib[yr +1] = fixed_contrib + no_contrib
      
      growing_contrib = growing_annuity(contrib, rate, growth, yr)
      modals$growing_contrib[yr+1] = growing_contrib + no_contrib
    }
    return(modals)
    
  })
  modalities2 <- reactive({melt(modals(), id.vars = 'year', variable.name = 'returns')})
  
   output$distPlot <- renderPlot({
     
     if(input$fct == "Yes"){
       ggplot(data = modalities2(), aes(x = year, y = value, group = returns, col = returns)) +
         geom_line() +
         geom_area(aes(fill = returns), alpha = 0.4) +
         geom_point(size = 1) +
         facet_wrap(~returns) +
         labs(x = "years", y = "value") +
         theme_bw()
     }
     else{
       ggplot(data = modalities2(), aes(x = year, y = value, group = returns, col = returns))+
         geom_line() +
         geom_point() +
         labs(x = "years", y = "value")
     }
     
   })
   
   output$modals <- renderTable({
     modals()
     
     
   })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

#scale_alpha(guide = "none")