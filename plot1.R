#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
library(stats)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


summary <- aggregate(Emissions ~ year,NEI, sum) # overview of emissions per year 

png("plot1.png",width=480,height=480,units="px",bg="white")

format(summary$Emissions, scientifc=FALSE) #removing scientific notation from the Y axis 

#plotting emissions over time; 
# ATTENTION: emissions are converted from tons to kilotons by dividing to 1e3
barplot(
  (summary$Emissions)/10^3, 
  names.arg=summary$year,
  xlab="Year",
  ylab="PM2.5 Emissions (kilotons) ",
  main="Total PM2.5 Emissions - United States ",
  col='lightgreen'
)

dev.off()
