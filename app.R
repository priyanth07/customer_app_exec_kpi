library(shinythemes)
library(gridExtra)
library(ggplot2)
library(cowplot)    # for theme_minimal_hgrid()


server <- function(input, output, session) {
  
  
  #------------------------------------------# Load RDS Files #------------------------------------------#
  
  # Removes Scientific Notation
  options(scipen=999)
  
  
  p1_sales <- readRDS("p1_sales.rds")
  p2_sales <- readRDS("p2_sales.rds")
  p1_profit <- readRDS("p1_profit.rds")
  p2_profit <- readRDS("p2_profit.rds")
  p1_profit_ratio <- readRDS("p1_profit_ratio.rds")
  p2_profit_ratio <- readRDS("p2_profit_ratio.rds")
  p1_total_orders <- readRDS("p1_total_orders.rds")
  p2_total_orders <- readRDS("p2_total_orders.rds")
  p1_profit_per_order <- readRDS("p1_profit_per_order.rds")
  p2_profit_per_order <- readRDS("p2_profit_per_order.rds")
  p1_avg_days_to_ship <- readRDS("p1_avg_days_to_ship.rds")
  p2_avg_days_to_ship <- readRDS("p2_avg_days_to_ship.rds")
  p1_corporate_sales <- readRDS("p1_corporate_sales.rds")
  p2_corporate_sales <- readRDS("p2_corporate_sales.rds")
  p1_profitcust <- readRDS("p1_profitcust.rds")
  p2_profitcust <- readRDS("p2_profitcust.rds")
  
  
  
  
  #------------------------------------------# Main Shiny Server Plot Code #------------------------------------------#  
  
  
  #Executive Summary KPIs
  output$sales_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_sales, p2_sales, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )  
  
  output$profit_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_profit, p2_profit, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )  
  
  output$profit_ratio_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_profit_ratio, p2_profit_ratio, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )
  
  output$total_orders_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_total_orders, p2_total_orders, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )
  
  output$profit_perorder_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_profit_per_order, p2_profit_per_order, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )
  
  output$avg_days_toship_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_avg_days_to_ship, p2_avg_days_to_ship, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )
  
  output$corpsales_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_corporate_sales, p2_corporate_sales, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )
  
  output$profitcust_kpi =
    renderPlot(
      {
        cowplot::ggdraw(grid.arrange(p1_profitcust, p2_profitcust, ncol = 1))+
          theme(panel.background=element_rect(fill = "#2d2e3e",
                                              colour = "#2d2e3e"),
                plot.background = element_rect(fill = "#2d2e3e",
                                               colour = "#2d2e3e"))
      }
    )
  
  
}


#------------------------------------------# Shiny UI Code #------------------------------------------#  

ui=navbarPage(
  theme=shinytheme("slate"),
  "Customer Analytics",
  tabPanel("Executive Summary",
           
           tabsetPanel(
             
             tabPanel("KPI",
                      fluidRow(column(width = 6, offset = 0, style='padding-top:15px;')),
                      fluidRow(
                        column(3,plotOutput("sales_kpi")),
                        column(3,plotOutput("profit_kpi")),
                        column(3,plotOutput("profit_ratio_kpi")),
                        column(3,plotOutput("total_orders_kpi"))
                      ),
                      fluidRow(column(width = 6, offset = 0, style='padding-left:0px; padding-right:1px; padding-top:5px; padding-bottom:25px')
                      ),
                      fluidRow(
                        column(3,plotOutput("profit_perorder_kpi")),
                        column(3,plotOutput("avg_days_toship_kpi")),
                        column(3,plotOutput("corpsales_kpi")),
                        column(3,plotOutput("profitcust_kpi"))
                      ),
                      fluidRow(column(width = 6, offset = 0, style='padding-bottom:15px;'))
             )
           )
  )
)

shinyApp(ui = ui, server = server)