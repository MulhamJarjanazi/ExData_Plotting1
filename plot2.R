data <- read.table("household_power_consumption.txt", 
                   skip=grep("1/2/2007", readLines("household_power_consumption.txt")),
                   sep=";")

data <- data[data$V1 %in% c("1/2/2007","2/2/2007"),]

names(data) <- c("date","time",
                 "globalactivepower","globalreactivepower",
                 "voltage","globalintensity",
                 "submetering1","submetering2","submetering3")

x <- as.numeric(levels(data$globalactivepower)[data$globalactivepower])

datetime <- paste(data$date, data$time, sep = ", ")
datetime <- strptime(datetime, format = "%d/%m/%Y, %H:%M:%S")
plot(datetime, 
     x, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (Kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()