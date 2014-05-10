
data <- read.csv(file="household_power_consumption.txt", sep= ";", header= TRUE)

#getting the subset of data where Date is 1/2/2007 and 2/2/2007
data1 <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

#conver Date and time to the correct format

data1$Time <- paste(data1$Date, data1$Time)  

data1$Time <- strptime(data1$Time, format="%d/%m/%Y  %H:%M:%S")

data1$Date <- as.Date(data1$Date, "%d/%m/%Y")

#convert the Global_active_power from factor to numeric
data1$Sub_metering_1 <- (as.numeric(as.character(data1$Sub_metering_1)))
data1$Sub_metering_2 <- (as.numeric(as.character(data1$Sub_metering_2)))
data1$Sub_metering_3 <- (as.numeric(as.character(data1$Sub_metering_3)))
#change locale to print the right weekday 
Sys.setlocale("LC_TIME", "C")

Sys.setenv(LANG = "en_US.UTF-8")



png(file = "plot3.png", width = 480, height = 480, units = "px",bg = "transparent")

plot(data1$Time,data1$Sub_metering_1, type="l", ylab="Engergy sub metering", xlab="", col="black")

lines(data1$Time,data1$Sub_metering_2, col="red")

lines(data1$Time,data1$Sub_metering_3, col="blue")


legend('topright', legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), bty='o',lty=1,cex=.75, box.lty = 1,box.col= "black")


dev.off()

