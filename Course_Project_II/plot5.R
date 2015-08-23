#########################################
## PLOT 5
# How have emissions from MOTOR VEHICLE SOURCES  changed from 1999-2008 in Baltimore City? 


# if you grepl "vehicle" from SCC (SCC.Level.Two), subset it to SCC and merge SCC to NEI, 
# you will notice that "vehicle" corresponds to all "on-road" values in NEI$type.

# Hence motor vehicles data can be simply obtained by subsetting NEI according to type

NEI_motor <- NEI[NEI$type=="ON-ROAD" & NEI$fips ==24510, ]
head(NEI_motor)


# Once the subset NEI_motor is determined, the generation of the plot resembles the generation of plot2
TotMotorBTM <- aggregate(Emissions ~ year, NEI_motor, sum)
head(TotMotorBTM)

plot5 <- ggplot(TotMotorBTM, aes(factor(year), Emissions))
plot5 <- plot5+geom_bar(stat="identity", fill="grey")+xlab("Year") +
  ylab("Total PM2.5 emissions by motor vehicles") + theme_bw() + guides(fill=FALSE) + 
  ggtitle("Total PM2.5 motor vehicles' emissions in Baltimore City (1999 to 2008)")
print(plot5)


plot5 <- function() {
  plot5 <- ggplot(TotMotorBTM, aes(factor(year), Emissions))
  plot5 <- plot5+geom_bar(stat="identity", fill="grey")+xlab("Year") +
    ylab("Total PM2.5 emissions by motor vehicles") + theme_bw() + guides(fill=FALSE) + 
    ggtitle("Total PM2.5 motor vehicles' emissions in Baltimore (1999 to 2008)")
  dev.copy(png, file="plot5.png", width=480, height=480)
  dev.off()
  cat("saved plot5.png", getwd())
}
plot5()

# Back to the question
# How have emissions from MOTOR VEHICLES changed from 1999-2008 in Baltimore City? 
# Emissions of PM2.5 by motor vehicles in Baltimore City have significantly decreased
# from 1999 to 2008 (by almost 2/4). A drastic decrease (from almost 400 to less than 
# 100 tons) has been registered from 1999 to 2002. The decrease from the latter to the next 
# quarter (2005-2008) has only been light.
