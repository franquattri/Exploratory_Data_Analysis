###############################################
## PLOT 6 

# Compare emissions from MOTOR VEHICLE SOURCES in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?


# first two subsets are created by county/city and fips from NEI, for BTM (Baltimore) and LA respectively

NEI_motorBTM <- NEI[NEI$type=="ON-ROAD" & NEI$fips ==24510, ]
head(NEI_motorBTM)
# if I compile 
# NEI_motor_LA <- NEI[NEI$type=="ON-ROAD & NEI$fips==06037,] # the result is an empty table
# I therefore re-subset the NEI dataframe to extract the NEI_motor_LA data 

motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
head(motor)
SCC_motor <- SCC[motor,]$SCC
head(SCC_motor)
NEI_motor <- NEI[NEI$SCC %in% SCC_motor,]
head(NEI_motor)
NEI_motor_LA <- NEI_motor[NEI_motor$fips=="06037",]
head(NEI_motor_LA)

# two subsets have been created
NEI_motorBTM <- NEI[NEI$type=="ON-ROAD" & NEI$fips ==24510, ]
head(NEI_motorBTM)
NEI_motorLA <- NEI_motor[NEI_motor$fips=="06037",]



# they are bound together through the rbind() function into the variable NEI_motorBTM_LA
NEI_motorBTM_LA <- rbind(NEI_motorBTM, NEI_motorLA)
head(NEI_motorBTM_LA)
tail(NEI_motorBTM_LA)

# two further variables are added to the two subsets respectively to specify the city / county
# the data belong to 
NEI_motorLA$city <- "Los Angeles County"
NEI_motorBTM$city <- "Baltimore City"
str(NEI_motorLA)
str(NEI_motorBTM)

# NEI_motorBTM_LA is re-compiled with the new variables included
NEI_motorBTM_LA <- rbind(NEI_motorBTM, NEI_motorLA)
head(NEI_motorBTM_LA)
tail(NEI_motorBTM_LA)


plot6 <- ggplot(NEI_motorBTM_LA, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity", fill="grey") +
  facet_grid(scales="free", space="free", .~city) + xlab("Year") +
  ylab("Total PM2.5 emissions") + theme_bw() + guides(fill=FALSE) +
  ggtitle("Total motor vehicle emissions in two U.S. counties (1999-2008)")
print(plot6)


# transfer plot to png
plot6 <- function() {
  plot6 <- ggplot(NEI_motorBTM_LA, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(aes(fill=year),stat="identity", fill="grey") +
    facet_grid(scales="free", space="free", .~city) + xlab("Year") +
    ylab("Total PM2.5 emissions") + theme_bw() + guides(fill=FALSE) +
    ggtitle("Total motor vehicle emissions in two U.S. counties (1999-2008)")
  dev.copy(png, file="plot6.png", width=480, height=480)
  dev.off()
  cat("saved plot6.png", getwd())
}
plot6()

# Back to the question
# Which city has seen greater changes over time in motor vehicle emissions?
# The levels of motor vehicle pollution in Baltimore City have always been very low from 1999 to 2008.
# The levels of the same kind of pollution were on the contrary already very high in 1999 in LA 
# (around 6000 tons in 1999). They have furher increased and reached a pick in 2005 to decrease again in 2008
# to almost (yet in comparison still higher) the same levels as in 1999.
