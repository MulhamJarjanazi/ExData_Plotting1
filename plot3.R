data <- read.table("household_power_consumption.txt", 
                   skip=grep("1/2/2007", readLines("household_power_consumption.txt")),
                   sep=";")

data <- data[data$V1 %in% c("1/2/2007","2/2/2007"),]

names(data) <- c("date","time",
                 "globalactivepower","globalreactivepower",
                 "voltage","globalintensity",
                 "submetering1","submetering2","submetering3")

x1 <- as.numeric(levels(data$submetering1)[data$submetering1])
x2 <- as.numeric(levels(data$submetering2)[data$submetering2])
x3 <- data$submetering3

plot(datetime, x1, type = "l", xlab = "", ylab = "Energy sub metering")
points(datetime, x2, type = "l", col = "red")
points(datetime, x3, type = "l", col = "blue")
legend("topright", 
       pch = "_", 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()
