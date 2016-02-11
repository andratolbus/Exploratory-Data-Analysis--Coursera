# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


vehicle<- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]
baltimore<-subset(NEI, NEI$fips=="24510")
la<-subset(NEI, NEI$fips=="06037")

cities<-rbind(la, baltimore)

all<-merge(cities, vehicle)

all$city[all$fips=="06037"]<-"Los Angeles"
all$city[all$fips=="24510"]<-"Baltimore"

summary <- aggregate(Emissions ~ year+city,all, sum) 


png("plot6.png",width=700,height=480,units="px",bg="white")

ggplot (summary,aes(factor(year),Emissions,fill=city)) +
  geom_bar(stat="identity") +
  theme_bw()+  facet_grid(.~city, scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM2.5 Emission (tons) ")) + 
  ggtitle("Total emissions from motor vehicles (Baltimore vs Los Angeles)")+ theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16, hjust=0.5)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=13)) 

dev.off()
