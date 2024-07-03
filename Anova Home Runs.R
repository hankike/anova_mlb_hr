library(readxl)
library(ggrepel)
library(dplyr)
setwd("~/Downloads/Personal Stats")

# Each home run is in a sheet separated by month, so compile them all here
March = read_excel("Homerun Tracker.xlsx",  
                             sheet = "March") 
April = read_excel("Homerun Tracker.xlsx",  
                             sheet = "April") 
May = read_excel("Homerun Tracker.xlsx",  
                             sheet = "May")
June = read_excel("Homerun Tracker.xlsx",  
                 sheet = "June")
Homerun_Tracker = rbind(March, April, May, June)
Homerun_Tracker = data.frame(Homerun_Tracker)

# For ANOVA, we are trying to avoid neautral sight games as they disrupt the flow of our data. Remove all neautral sigh games.
Homerun_Tracker = Homerun_Tracker[-c(1, 2, 805, 808, 809, 819, 851, 857, 862), ]

# Run ANOVA for distance
anova <- aov(Distance ~ Stadium, data = Homerun_Tracker)
summary(anova)

ggplot(Homerun_Tracker, aes(x = Distance, fill = Stadium)) +geom_histogram(aes(y = ..count..), breaks = seq(300, 500, by = 25)) + 
  scale_x_continuous(breaks = seq(300, 500, by = 25)) + theme_classic() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x = "Distance", y = "Number of Home Runs") + ggtitle("Home Runs Hit by Distance") +
  theme(legend.position = "none")
