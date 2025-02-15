# Load data
data <- read.csv("./Data/household_power_consumption.txt", header=TRUE, sep=';', 
                 na.strings="?", nrows=2075259, stringsAsFactors=FALSE)

# Convert Date column and filter required data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Create Datetime column
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot multiple graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data$Datetime, data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

plot(data$Datetime, data$Voltage, type="l", 
     ylab="Voltage (volt)", xlab="")

plot(data$Datetime, data$Sub_metering_1, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Datetime, data$Sub_metering_2, col='red')
lines(data$Datetime, data$Sub_metering_3, col='blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Datetime, data$Global_reactive_power, type="l", 
     ylab="Global Reactive Power (kilowatts)", xlab="")

# Save plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()