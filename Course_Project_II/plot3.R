###########################################
## PLOT 3 

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# the variables taken into account for this task (over a subset of NEI called NEI_BTM 
# with just the values of Baltimore) are: 
# Emissions, year and type

library(ggplot2)
head(NEI$type)


NEI_BTM <- NEI[NEI$fips == "24510",]

TotEmissionsBTMtype <- aggregate(Emissions ~ year + type, NEI_BTM, sum)

plot3 <- ggplot(TotEmissionsBTMtype, aes(year, Emissions, color = type))
plot3 <- plot3+geom_line()+xlab("Year") +ylab("Total PM2.5 Emissions") +
  ggtitle("Total PM2.5 emissions in Baltimore City by type (1999-2008)")
print(plot3)


# transfer plot to png
plot3 <- function() {
  plot3 <- ggplot(TotEmissionsBTMtype, aes(year, Emissions, color = type))
  plot3 <- plot3+geom_line()+xlab("Year") +ylab("Total PM2.5 Emissions") + 
    ggtitle("Total PM2.5 emissions in Baltimore City by type (1999-2008)")
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("saved plot3.png", getwd())
}
plot3()

# Back to the questions
# which of these four sources have seen decreases in emissions from 1999-2008 
#for Baltimore City? Which have seen increases in emissions from 1999-2008?
# In the end all types have experienced a decrease in emissions. "Point" in particular has 
# had a huge pick downwards from 2005 to 2008, but it is also the only type 
# to a) have experienced a rise and b) further to that, a steep rise of emissions from 2002 to 2005.
