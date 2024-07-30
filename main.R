## clearing the work environment
rm(list = ls())

## importing the necessary libraries
library(tidyverse)
library(ggplot2)
library(readxl)

## getting the files in project directory
#dir()

## importing the data set
#demo <- read_excel("demo.xlsx")

## looping

## getting the columns of the data
#col_names <- colnames(demo)



## a function
plot_graph <- function(demo) {
  ## changing the data format so as to plot the data well
  demo <- demo %>% 
    pivot_longer(!Districts,names_to = "category", values_to = "percent")
  
  ## this is for plotting a compound graph
  ggplot(demo, aes(x = category, y = percent, fill = Districts)) + 
    geom_bar(stat = "identity", position = position_stack(reverse = FALSE),
             color = "black") +
    coord_flip() +
    geom_text(aes(label = paste(percent*100,"%")), position = position_stack(vjust = 0.5)) +
    theme(legend.position = "bottom",panel.background = element_rect(fill = "white"),
          axis.text.x = element_blank(),
          axis.ticks = element_blank(),
          axis.title = element_blank(),
          legend.title = element_blank()) +
    scale_fill_manual(values = c("#FFF68F","#FF6A6A","#CDC9C9","#5CACEE","#FFFF00"))
  for (i in seq(1,length(excel_sheets("analysis.xlsx")))) {
    
  }
  ggsave("plot.png",
         plot = last_plot(),
         width = 10, height = 6, 
         units = "in",
         dpi = 500)
}


## list of the sheets in the excel_work_book
mylist <- lapply(1:length(excel_sheets("analysis.xlsx")), function(i) read_excel("analysis.xlsx", sheet = i))


## a for loop to loop to the sheets and plot individual graph
for (i in mylist) {
  plot_graph(i)
}


























