# Read the data
data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', stringsAsFactors = FALSE)
sub <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
datetimeStrs <- paste(sub$Date, sub$Time, sep = ' ')
Datetime <- strptime(datetimeStrs, "%d/%m/%Y %H:%M:%S")
sub <- cbind(sub, Datetime)
sub$Global_active_power <- as.numeric(sub$Global_active_power)

# Create the plots
png("plot4.png", width = 504, height = 504)
par(mfrow = c(2, 2))

plot(sub$Datetime, sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

plot(sub$Datetime, sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(sub$Datetime, sub$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(sub$Datetime, sub$Sub_metering_2, col = "red")
lines(sub$Datetime, sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1, col = c("black", "red", "blue"))

plot(sub$Datetime, sub$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
