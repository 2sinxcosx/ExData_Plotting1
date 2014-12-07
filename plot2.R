#Download and read
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists('/home/ann/plot/exdata_data_household_power_consumption.zip')) {
  download.file(url, 'exdata_data_household_power_consumption.zip', method = "curl")
  unzip('exdata_data_household_power_consumption', exdir='./plot')
}
data <- read.csv("./plot/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="",quote='\"')
#Set as date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Subset
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]

#Plot2
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Save to png
dev.copy(png, file="plot2.png")
dev.off()

