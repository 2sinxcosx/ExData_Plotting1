#Download and read
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists('/home/ann/plot/household_power_consumption.zip')) {
  download.file(url, 'household_power_consumption.zip', method = "curl")
  unzip('household_power_consumption.zip', exdir='./plot')
}
data <- read.csv("./plot/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="",quote='\"')
#Set as date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Subset
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#Plot1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Save to png
dev.copy(png, file="plot1.png")
dev.off()

