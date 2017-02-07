png(filename = "plot2.png", width = 480, height = 480)


with(powerconsum_data, plot(Time, Global_active_power, type="l", xaxt="n", xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(side = 1, at= c(0.0, 0.5, 1.0), labels = c("Thu", "Fri", "Sat"), tick = TRUE)

dev.off()

