## PLOT 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
head(NEI$SCC)
str(SCC)
# for this assignment, the used database is again NEI (data from U.S.)
# coal combustion-related resources appear in different variables in SCC.

# Justification: To retrieve all coal combustion-related resources, grepl function is used upon the 
# variable "Short.Name" in SCC and the 
# results are saved under SCC_subset

# Notice that, as suggested by the community TA Joe Pechacek, " There is no right answer to what you should have subset on. As long as you have extracted coal sources 
# from the data set and have explained your reasoning for the choice made, you will be fine. [...] It is a common fear to think that peers will be overly critical, but if you met the requirements for the plots and they look good, 
# your fellow students will not and should not downgrade based on your data subset choices" (Discussion forum, Course Project II,
# 14 days ago at the time this was read).

coal  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
SCC_subset <- SCC[coal, ]


# SCC_subset is then merged to the existing NEI to continue plotting
if(!exists("NEI_SCC_subset")){
  NEI_SCC_subset <- merge(NEI, SCC_subset, by="SCC", na.rm=TRUE)
}

str(NEI_SCC_subset)
length(coal %in% NEI_SCC_subset) # coal is not there in 11717 out of 53400 observations

# the subset NEI_SCC_subset only contains coal-related values, entailed in the variables: 
# Short.Name
# EI.Sector
# 

#the relation Emissions over year in relation to subset is plotted
TotEmissionsSCC_subset <- aggregate(Emissions ~ year, NEI_SCC_subset, sum)



plot4 <- ggplot(TotEmissionsSCC_subset, aes(factor(year), Emissions))
plot4 <- plot4+geom_bar(stat="identity", fill="grey")+xlab("Year") +
  ylab("Total PM2.5 emissions") + theme_bw() + guides(fill=FALSE) +
  ggtitle("Total coal-related emissions in the U.S. (1999-2008)")
print(plot4)

# again, to enable better readibility of the y axis, I transform the e+05 values into 
# cardinal numbers
plot4 <- ggplot(TotEmissionsSCC_subset, aes(factor(year), Emissions/10^5))
plot4 <- plot4+geom_bar(stat="identity", fill="grey")+xlab("Year") +
  ylab("Total PM2.5 emissions (in tons)") + theme_bw() + guides(fill=FALSE) + 
  ggtitle("Total coal-related emissions in the U.S. (1999-2008)")
print(plot4)


# transfer plot to png
plot4 <- function() {
  plot4 <- ggplot(TotEmissionsSCC_subset, aes(factor(year), Emissions/10^5))
  plot4 <- plot4+geom_bar(stat="identity", fill="grey", width=0.75)+xlab("Year") +
    ylab("Total PM2.5 emissions (in tons)") + theme_bw() + guides(fill=FALSE) +
    ggtitle("Total coal-related emissions in the U.S. (1999-2008)")
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("saved plot4.png", getwd())
}
plot4()


# Back to the question: 
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
# Answer: The emissions of coal-related resources reached their highest level in the United States in 1999. 
# After that, they have considerably decreased.
# A slight rise has been observed in the quarter 2002-2005, which has registered a slight increase from the 
# previous quarter. Particularly dramatic has been the decrease in coal emissions from 2005 to 2008.
# From 1999 to 2008, emissions of PM2.5 related to coal in the U.S. has almost halved from quarterly 
# 6e+05 to less than 4e+05 tons.



