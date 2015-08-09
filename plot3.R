## code for plot3 ## 


# In plot 3, the plot should represent the interaction of four variables in total, the consumption$Sub_metering_1,
# consumption$Sub_metering_2 and consumption$Sub_metering_3 and their relation with consumption$Datetime (from plot2)
# respectively. This time the plot should contain a legend with separate colors for each of the here supposed dependent 
# variables on the y-axis.
# It means that I should represent three behaviours under one plot, the first by calling the plot() function, the second and the third 
# by calling the lines() function as I am writing on an existing plot

plot(consumption$Datetime,consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(consumption$Datetime,consumption$Sub_metering_2,col="red")
lines(consumption$Datetime,consumption$Sub_metering_3,col="blue")

# the legend should be topright in the plot
legend("topright", col =c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# and I should add lines before the names
legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)

# saving plot3.png

plot3 <- function() {
  plot(consumption$Datetime,consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(consumption$Datetime,consumption$Sub_metering_2,col="red")
  lines(consumption$Datetime,consumption$Sub_metering_3,col="blue")
  legend("topright", col = c("black", "red", "blue"), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("saved plot3.png", getwd())
}
plot3()

