#Download and read
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists('/home/ann/plot/exdata_data_household_power_consumption.zip')) {
  download.file(url, 'exdata_data_household_power_consumption.zip', method = "curl")
  unzip('exdata_data_household_power_consumption', exdir='./plot')
}
data <- read.csv("./plot/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="",quote='\"')
#Set as date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Subset
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#Plot4
par(mfcol = c(2, 2))
#Top left
plot(x = data$DateTime, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
#Bottom left
plot(x = data$DateTime, y = data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x = data$DateTime, y = data$Sub_metering_1)
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")
#Add legend to the plot
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Top right
plot(x = data$DateTime, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Bottom right
plot(x = data$DateTime, y = data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
#Save to png
dev.copy(png, file="plot4.png")
dev.off()

