#4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal<- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

#coal$SCC<-as.character(coal$SCC)
#NEI$SCC<-as.character(NEI$SCC)
all<-merge(NEI, coal)


summary <- aggregate(Emissions ~ year,all, sum) 

png("plot4.png",width=700,height=480,units="px",bg="white")

# ATTENTION: converting the emissions to kilotons when plotting 

ggplot (summary,aes(factor(year),Emissions/10^3, fill=year)) +
  geom_bar(stat="identity") +
  theme_bw()+ 
  labs(x="Year", y=expression("Total PM2.5 Emission (kilotons) ")) + 
  ggtitle("Total emissions from coal related sources in US")+ theme(plot.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=16, hjust=0.5)) +
  theme(axis.title = element_text(family = "Trebuchet MS", color="#666666", face="bold", size=13))


dev.off()

