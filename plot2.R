## Code for plot2 ##

# For the second plot, I consider the subsetted plot "consumption" from plot1, but the date needs to be further changed
# Notice that x specifies a span of *days* (Thur-Sat). 
# I paste together Consumption$Date and consumption$Time and the POSXIct function is adopted
# plot2 represents the relation between the 2 variables consumption$Global_active_power and consumption$Datetime

datetime <- paste(as.Date(consumption$Date), consumption$Time)
consumption$Datetime <- as.POSIXct(datetime)
head(consumption$Datetime)

plot(consumption$Global_active_power ~ consumption$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# saving the plot in png format 
plot2 <- function() {
  plot(consumption$Global_active_power ~ consumption$Datetime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("saved plot2.png", getwd())
}
plot2()





