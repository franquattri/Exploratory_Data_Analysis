## code for plot1 ##

# estimate how much time the computer will require in memory to read the file
system.time(readLines("./exdata_data_household_power_consumption/household_power_consumption.txt"))
# on a very slow machine
# user  system elapsed 
# 59.47    1.19   65.74 

# or you can do a rough calculation with 
# rows * # columns * 8 bytes / 2^20
#2075260 * 1 * 8 / 2^20 >> 15.83298

# now that you have a rough estimate of the time reading the table, you can upload it 

# while reading the table, I already want to assign names to its columns. We know that there are the following variables in the dataframe:

# Time
# Global_active_power
# Global_reactive_power
# Voltage
# Global_intensity
# Sub_metering_1
# Sub_metering_2
# Sub_metering_3


require(stringr)

consumption <- "./exdata_data_household_power_consumption/household_power_consumption.txt"
consumption <- read.table(consumption, col.names = c("Date", "Time", "Global_active_power", 
                                                     "Global_reactive_power", "Voltage", "Global_intensity", 
                                    "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
head(consumption)
str(consumption) # with the exception of Sub_metering_3 (numeric), all variables are factors



# Now that the variables have been renamed, I can subset the needed data, that go 
# from 02/01/2007 to 02/02/2007 (two-day time span)


"2/2/2007" %in% consumption$Date # returns TRUE
"1/2/2007" %in% consumption$Date # returns TRUE
typeof(consumption$Date[3]) # it is an integer

# an hint given from the lecturer is that we may want to apply strptime() and as.Date()

consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
head(consumption$Date)

# I now want to subset "consumption" according to date 
consumption <- consumption[(consumption$Date=="2007-02-01") | (consumption$Date=="2007-02-02"),]



# the first plot is a histogram (i.e. taking one variable), showing the frequency of the consumption$Global_active_power
# in col="red",xlab="Global active power (kilowatts), ylab="Frequency", main="Global Active Power"

# since consumption$Global_active_power is a factor, I specify as.numeric, not just for this, but for all 
# variables (to avoid different results from the example on the x-axis)

# I therefore change all variables from factors as.numeric 
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
consumption$Global_reactive_power <- as.numeric(as.character(consumption$Global_reactive_power))
consumption$Voltage <- as.numeric(as.character(consumption$Voltage))
consumption$Sub_metering_1 <- as.numeric(as.character(consumption$Sub_metering_1))
consumption$Sub_metering_2 <- as.numeric(as.character(consumption$Sub_metering_2))
#consumption$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3)) # already as.numeric

# I plot the histogram
hist(as.numeric(consumption$Global_active_power),col="red",xlab="Global active power (kilowatts)", ylab="Frequency",
     main = "Global Active Power")


# Further assignment:
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# You must also include the code that creates the PNG file.

# I create a function that saves my plot in my designated directory and tells me if it has been saved 
# ("saved plotx.png")

plot1 <- function() {
  hist(consumption$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("saved plot1.png", getwd())
}
plot1()


