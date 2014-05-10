
data <- read.csv(file="household_power_consumption.txt", sep= ";", header= TRUE)

#getting the subset of data where Date is 1/2/2007 and 2/2/2007
data1 <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

#conver Date and time to the correct format

data1$Time <- paste(data1$Date, data1$Time)  

data1$Time <- strptime(data1$Time, format="%d/%m/%Y  %H:%M:%S")

data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

#convert the Global_active_power from factor to numeric
data1$Global_active_power <- (as.numeric(as.character(data1$Global_active_power)))


png(file = "plot1.png", width = 480, height = 480, units = "px",bg = "transparent")

hist(data1$Global_active_power, main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col = "red")

dev.off()

