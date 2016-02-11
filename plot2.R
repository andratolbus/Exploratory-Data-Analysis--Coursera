#2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary <- aggregate(Emissions ~ year,subset(NEI,NEI$fips=="24510"), sum) 

png("plot2.png",width=480,height=480,units="px",bg="white")


#plotting emissions over time; 
barplot(
  (summary$Emissions), 
  names.arg=summary$year,
  xlab="Year",
  ylab="PM2.5 Emissions (tons) ",
  main="Total PM2.5 Emissions - Baltimore City ",
  col='lightblue'
)

dev.off()
