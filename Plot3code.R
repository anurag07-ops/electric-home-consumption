# Load data
data <- read.csv("./Data/household_power_consumption.txt", header=TRUE, sep=';', 
                 na.strings="?", nrows=2075259, stringsAsFactors=FALSE)

# Convert Date and filter
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create Datetime column
data$Datetime <- as.POSIXct(paste(data$Date, data$Time))

# Plot
plot(data$Datetime, data$Sub_metering_1, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()