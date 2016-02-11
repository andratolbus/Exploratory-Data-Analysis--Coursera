#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


vehicle<- SCC[grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE),]
baltimore<-subset(NEI, NEI$fips=="24510")

all<-merge(baltimore, vehicle)

summary <- aggregate(Emissions ~ year,all, sum) 

png("plot5.png",width=700,height=480,units="px",bg="white")

ggplot (summary,aes(factor(year),Emissions, fill=year)) +
  geom_bar(stat="identity") +
  theme_bw()+ 
  labs(x="Year", y=expression("Total PM2.5 Emission (tons) ")) + 
  ggtitle("Total emissions from motor vehicles in Baltimore")+ theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16, hjust=0.5)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=13))

dev.off()