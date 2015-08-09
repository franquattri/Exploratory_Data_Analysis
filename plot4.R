## Code for plot 4 ## 


# plot 4 contains two of the already generated plots, namely plot2 and plot3, plus two more plots, which 
# represent the relation between consumption$Voltage and consumption$Datetime and consumption$Global_reactive_power 
# and consumption$Datetime respectively.
# the dimension of the plot need to be adjusted through the par(mfrow()) function

# first I generate the frame of my plot (2 rows, 2 columns, and smaller size than the default)
par(mfrow = c(2, 2), mar = c(4,4,1,1))
# then I add in the plot. The default disposition of the plots is from left to right top down. 

# first plot (=already generated plot 2)
plot(consumption$Global_active_power ~ consumption$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
# second plot (consumption$Voltage ~ consumption$Datetime)
plot(consumption$Voltage ~ consumption$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
# third plot(=already generated plot 3, with legend)
plot(consumption$Datetime,consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(consumption$Datetime,consumption$Sub_metering_2,col="red")
lines(consumption$Datetime,consumption$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)
# fourth plot(consumption$Global_reactive_time ~ consumption$Datetime)
plot(consumption$Global_reactive_power ~ consumption$Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# here you can notice that there is a problem with the legend in plot 3, which 
# covers part of the line (in the first run of the code)
# I can shrink the legend by following these instructions 
# http://stackoverflow.com/questions/24361598/reduce-size-of-legend-area-in-barplot


# running the plot again with shrunk legend

par(mfrow = c(2, 2), mar = c(4,4,2,2))

plot(consumption$Global_active_power ~ consumption$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
# second plot (consumption$Voltage ~ consumption$Datetime)
plot(consumption$Voltage ~ consumption$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
# third plot(=already generated plot 3, with legend)
plot(consumption$Datetime,consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(consumption$Datetime,consumption$Sub_metering_2,col="red")
lines(consumption$Datetime,consumption$Sub_metering_3,col="blue")
legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, cex = .5)
# fourth plot(consumption$Global_reactive_time ~ consumption$Datetime)
plot(consumption$Global_reactive_power ~ consumption$Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# copying the plot in png format


plot4 <- function() {
  plot(consumption$Global_active_power ~ consumption$Datetime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(consumption$Voltage ~ consumption$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(consumption$Datetime,consumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(consumption$Datetime,consumption$Sub_metering_2,col="red")
  lines(consumption$Datetime,consumption$Sub_metering_3,col="blue")
  legend("topright", col = c("black", "red", "blue"), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, cex = .5)
  plot(consumption$Global_reactive_power ~ consumption$Datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("saved plot4.png", getwd())
}
plot4()



