#################################################
##PLOT 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

head(NEI[NEI$fips=="24510",], 10)

NEI_BTM <- NEI[NEI$fips == "24510",]

TotEmissionsBTM <- aggregate(Emissions ~ year, NEI_BTM, sum)

barplot(
  (TotEmissionsBTM$Emissions)/10^6,
  names.arg=TotEmissionsBTM$year,
  xlab="Year",
  ylab="Total PM2.5 Emissions (in tons)",
  main="Total PM2.5 emissions in Baltimore City (1999-2008)"
)

# since the values of the emissions are not as high as in the previous plot, 
# the real value in tons can be held


barplot(height=TotEmissionsBTM$Emissions, names.arg=TotEmissionsBTM$year, 
        xlab="Year", ylab=expression('Total PM2.5 emission'),
        main=expression('Total PM2.5 emissions in Baltimore City (1999-2008)'))


plot2 <- function() {
  barplot(height=TotEmissionsBTM$Emissions, names.arg=TotEmissionsBTM$year, 
          xlab="Year", ylab=expression('Total PM2.5 emission'),
          main=expression('Total PM2.5 emissions in Baltimore City (1999-2008)'))
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("saved plot2.png", getwd())
}
plot2()

# back to the question: 
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008? 
# Answer: Yes, they have 
