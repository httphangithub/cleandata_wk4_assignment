powerconsum_data$Sub_metering_1 <- as.numeric(powerconsum_data$Sub_metering_1)
powerconsum_data$Sub_metering_2 <- as.numeric(powerconsum_data$Sub_metering_2)
powerconsum_data$Sub_metering_3 <- as.numeric(powerconsum_data$Sub_metering_3)
powerconsum_data$Global_reactive_power <- as.numeric(powerconsum_data$Global_reactive_power)
powerconsum_data$Voltage <- as.numeric(powerconsum_data$Voltage)
powerconsum_data$Global_intensity <- as.numeric(powerconsum_data$Global_intensity)

png(filename = "plot3.png", width = 480, height = 480)
plot(powerconsum_data$Time, powerconsum_data$Sub_metering_1, col="dark grey", type = "l", xaxt="n", xlab = "", ylab = "Energy sub metering")
lines(powerconsum_data$Time, powerconsum_data$Sub_metering_2, col="red", type = "s")
lines(powerconsum_data$Time, powerconsum_data$Sub_metering_3, col="blue", type = "s")
axis(side = 1, at= c(0.0, 0.5, 1.0), labels = c("Thu", "Fri", "Sat"), tick = TRUE)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd=2, col=c("dark grey","red", "blue"))
dev.off()