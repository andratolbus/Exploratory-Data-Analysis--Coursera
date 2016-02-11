# 3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
#    which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary <- aggregate(Emissions ~ year+type,subset(NEI,NEI$fips=="24510"), sum) 


png("plot3.png",width=700,height=480,units="px",bg="white")

 ggplot (summary,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw()+  facet_grid(.~type, scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM2.5 Emission (tons) ")) + 
   ggtitle("Total PM2.5 emissions in Baltimore city by source type ")+ theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16, hjust=0.5)) +
    theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=13)) 

 dev.off()
 
 
