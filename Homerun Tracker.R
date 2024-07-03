library(readxl)
library(ggrepel)
library(dplyr)
setwd("~/Downloads/Personal Stats")


#Download your data
Homerun_Tracker = read_excel("Homerun Tracker.xlsx",  
                  sheet = "May") 
Homerun_Tracker = data.frame(Homerun_Tracker)

#Get certain date
df<-Homerun_Tracker[c(510:729),]
count(df, HR.Park)
count(df, Team)

#Daily Data
Daily_Plot = ggplot(df, aes(x= Exit.Velocity, y=Distance, col=Team)) +
  geom_point() +theme_classic() +
  xlim(c(90, 115)) + ylim(c(330, 470)) +
  labs(x = "Exit Velocity (mph)", y = "Distance (feet)") + ggtitle("Home Runs May 20th - 26th")
Daily_Plot

#Add color
Daily_Plot + scale_color_manual(breaks = c("Athletics", "Angels", "Astros", "Blue Jays", "Braves", "Brewers", "Cardinals", "Cubs", "Diamondbacks", "Dodgers",
                                           "Giants", "Guardians", "Mariners", "Marlins", "Mets", "Nationals", "Orioles", "Padres", "Phillies", "Pirates",
                                           "Rangers", "Rays", "Red Sox", "Reds", "Rockies", "Royals", "Tigers", "Twins", "White Sox", "Yankees"),
                                values=c("#003831", "#ba0021", "#eb6e1f", "#13418e", "#ce1141", "#ffc52f", "#c41e3a", "#0e3386", "#e3d4ad", "#00519c",
                                         "#fd5a1e", "#00385d", "#005c5c", "#00a3e0", "#ff5910", "#ab0003", "#df4601", "#2f241d", "#e81828", "#fdb827",
                                         "#003278", "#8fbce6", "#bd3039", "#c6011f", "#333366", "#bd9b60", "#fa4616", "#d31145", "#27251f", "#c4ced3"))+
  theme(panel.background = element_rect(fill = '#f7f7f7', color = 'black'), legend.position = "none")


#As a note, for histograms you must use scale_fill_manual() instead of scale_color_manual()

Monthly = ggplot(Homerun_Tracker, aes(x= Exit.Velocity, y=Distance, col=Team)) +
  geom_point() +theme_classic() +
  xlim(c(90, 122)) + ylim(c(310, 480)) +
  labs(x = "Exit Velocity (mph)", y = "Distance (feet)") + ggtitle("May Home Runs") + 
  scale_color_manual(breaks = c("A's", "Angels", "Astros", "Blue Jays", "Braves", "Brewers", "Cardinals", "Cubs", "Diamondbacks", "Dodgers",
                                        "Giants", "Guardians", "Mariners", "Marlins", "Mets", "Nationals", "Orioles", "Padres", "Phillies", "Pirates",
                                        "Rangers", "Rays", "Red Sox", "Reds", "Rockies", "Royals", "Tigers", "Twins", "White Sox", "Yankees"),
                             values=c("#003831", "#ba0021", "#eb6e1f", "#13418e", "#ce1141", "#ffc52f", "#c41e3a", "#0e3386", "#e3d4ad", "#00519c",
                                      "#fd5a1e", "#00385d", "#005c5c", "#00a3e0", "#ff5910", "#ab0003", "#df4601", "#2f241d", "#e81828", "#fdb827",
                                      "#003278", "#8fbce6", "#bd3039", "#c6011f", "#333366", "#bd9b60", "#fa4616", "#d31145", "#27251f", "#c4ced3"))+
  theme(panel.background = element_rect(fill = '#f7f7f7', color = 'black'), legend.position = "none")
Monthly

#Labels
Monthly + 
  annotate("text", x = 96.3, y = 467, label = "Adley Rutschman", size=3) +
  annotate("text", x = 119, y = 473, label = "Aaron Judge", size=3) +
  annotate("text", x = 102.9, y = 316, label = "LaMonte Wade Jr.", size=3)
