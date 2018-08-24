
file<-"household_power_consumption.txt"
if(!file.exists(file)){
          download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="zipfold.zip", mode="wb")
          unzip("zipfold.zip")
}

data<-read.table("./household_power_consumption.txt", sep=";", na.string="?", header=T)
data<-subset(data,as.Date(data$Date, format="%d/%m/%Y")=="2007-02-01" | (as.Date(data$Date, format="%d/%m/%Y")=="2007-02-02"), na.rm=T)

hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()