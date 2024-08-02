## clearing the work environment
rm(list = ls())

## importing the necessary libraries
library(tidyverse)
library(ggplot2)
library(readxl)

## getting the files in project directory
#dir()


## getting the sheet name
sheet_name <- excel_sheets("analysis.xlsx")

## a function to plot the graph
plot_graph <- function(demo) {
  ## changing the data format so as to plot the data well
  demo <- demo %>% 
    pivot_longer(!Districts,names_to = "category", values_to = "percent")
  
  ## this is for plotting a compound graph
  ggplot(demo, aes(x = category, y = percent, fill = Districts)) + 
    geom_bar(stat = "identity", position = position_stack(reverse = FALSE),
             color = "black") +
    coord_flip() +
    geom_text(aes(label = paste(percent*100,"%")), position = position_stack(vjust = 0.5),
              size = 3) +
    theme(legend.position = "bottom",panel.background = element_rect(fill = "white"),
          axis.text.x = element_blank(),
          axis.ticks = element_blank(),
          axis.title = element_blank(),
          legend.title = element_blank(),
          axis.text.y = element_text(vjust = -12)) +
    scale_fill_manual(values = c("#FFF68F","#FF6A6A","#CDC9C9","#5CACEE","#FFFF00"))
}

## a for loop for looping through sheets
for (sheet in sheet_name) {
  demo <- read_excel("analysis.xlsx",sheet = sheet)
  plot_graph(demo)
}




























