library(ggplot2)
library(data.table)

Economist_Assignment_Data <- read_csv("Desktop/data-visualization-proj/1Economist_Assignment_Data.csv")
df <- Economist_Assignment_Data

pl <- ggplot(df, aes(x=CPI, y=HDI, color=Region)) + geom_point(size=4, shape=1) #circle colors, shape, and width/size
pl2 <- pl + geom_smooth(aes(group=1), method='lm', formula=y~log(x), se=FALSE, color='red') #lm = linear model (red line-best fit)
pl3 <- pl2 + geom_text(aes(label=Country)) #labeling the countries of data points

#labeling a subset
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
pl4 <- pl3 + theme_bw()
#print(pl4)

#labeling x and y axis
pl5 <- pl4 + scale_x_continuous(name="Corruption Perceptions Index, 2011 (10=least corrupt)", limits=c(.9, 10.5), breaks=1:10)
#print(pl5)
pl6 <- pl5 + scale_y_continuous(name="Human Development Index, 2011 (1=best)", limits=c(0.2, 1.0))
#print(pl6)

#title of plot
pl7 <- pl6 + ggtitle("Corruption and Human Development")

#using the ggthemes package to refine the graph for accurate appearance
library(ggthemes)
pl8 <- pl7 + theme_economist_white()
print(pl8)