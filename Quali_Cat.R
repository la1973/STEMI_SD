library(plyr)
library(reshape2)
library(sqldf)
library(tcltk2)
library(ggplot2)

setwd("/Users/lucianodeandrade/Desktop")
quali1 <- read.csv("/Users/lucianodeandrade/Desktop/Repositorio/STEMI_SD/Quali_1.csv", sep=",")
quali1
#quali1 <- read.csv("/Users/lucianodeandrade/Desktop/Repositorio/STEMI_SD/Quali_2.csv", sep=",")
#quali1

summary(quali1)
ggplot(quali1, aes(factor(Percent), Percentual, fill = factor(Causes_delay)), color="black") + geom_bar(width = .5, alpha=0.7) + scale_y_continuous(breaks = 0:01) + coord_polar() + labs(x = "", y = "") +  
  theme_grey(base_size = 22) +
  theme(
    axis.line.x = element_blank(),
    axis.line.y = element_blank(),
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.x = element_text(colour = "black"),
    axis.text.y = element_blank(),
    legend.justification = "center"
    #legend.position = "right",
    #legend.direction = "horizontal"
  ) 
       








