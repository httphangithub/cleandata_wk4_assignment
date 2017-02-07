library(data.table)
setwd("~/Documents/Rcourse/course4/week1")
powerconsum_raw <- fread("./household_power_consumption.txt")

powerconsum_raw$Date <- as.Date(powerconsum_raw$Date, format="%d/%m/%Y")

powerconsum_data <- powerconsum_raw[Date %in% as.Date(c("2007-02-01","2007-02-02"))]

library(chron)
powerconsum_data$Time <- chron(times = powerconsum_data$Time)

powerconsum_data$Global_active_power <- as.numeric(powerconsum_data$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)



hist(powerconsum_data$Global_active_power, col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.off()
