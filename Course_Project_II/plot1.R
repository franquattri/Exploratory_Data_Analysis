# loading the NEI and SCC dataframes from the .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

str(NEI) # 6497651 obs. of  6 variables
str(SCC)
# fips: A five-digit number (represented as a string) indicating the U.S. county
# SCC: The name of the source as indicated by a digit string (see source code classification table)
# Pollutant: A string indicating the pollutant
# Emissions: Amount of PM2.5 emitted, in tons
# type: The type of source (point, non-point, on-road, or non-road)
# year: The year of emissions recorded

head(NEI, 10)
str(SCC) # data.frame':  11717 obs. of  15 variables
head(SCC, 10)

#########################################################
## PLOT 1 
# Have TOTAL EMISSIONS from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

# For this task, two variables of NEI are considered, "Emissions" and "year" and put in relation (Emissions ~ year)
# since the total relation of the two of them over all years is needed, they have to be summed

TotEmissions <- aggregate(Emissions ~ year, NEI, sum)

# Barplot of the two variables
barplot(height=TotEmissions$Emissions, names.arg=TotEmissions$year, 
        xlab="Year", ylab=expression('Total PM2.5 emission'),
        main=expression('Total PM2.5 emissions in the U.S. (1999-2008)'))

# you can see from the plot, ylab, that the values of emission is expressed in tons (10^6)
# for better readibility, this could be converted into ordinal numbers (1 to x) by dividing the 
# value of the emissions by tons

barplot(
  (TotEmissions$Emissions)/10^6,
  names.arg=TotEmissions$year,
  xlab="Year",
  ylab="Total PM2.5 Emissions (in tons)",
  main="Total PM2.5 emissions in the U.S. (1999-2008)"
)


# I create a function that saves my plot in my designated directory and 
# tells me if it has been saved # ("saved plotx.png")

plot1 <- function() {
  barplot(
    (TotEmissions$Emissions)/10^6,
    names.arg=TotEmissions$year,
    xlab="Year",
    ylab="Total PM2.5 Emissions (in tons)",
    main="Total PM2.5 emissions in the U.S. (1999-2008)"
  )
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("saved plot1.png", getwd())
}
plot1()

# Back to the question:
# Have TOTAL EMISSIONS from PM2.5 decreased in the United States from 1999 to 2008? 
# Answer: Yes, they have 


