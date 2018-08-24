
file<-"household_power_consumption.txt"
if(!file.exists(file)){
          download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest="zipfold.zip", mode="wb")
          unzip("zipfold.zip")
}

data<-read.table("./household_power_consumption.txt", sep=";", na.string="?", header=T)
data<-subset(data,as.Date(data$Date, format="%d/%m/%Y")=="2007-02-01" | (as.Date(data$Date, format="%d/%m/%Y")=="2007-02-02"), na.rm=T)

t<-as.POSIXct(paste(data[,1],data[,2]), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(t, data$Global_active_power, ylab="Global Active Power", xlab="",type="n")
lines(t, data$Global_active_power)

plot(t, data$Voltage, ylab="Voltage", xlab="datetime",type="n")
lines(t, data$Voltage)

plot(t, data$Sub_metering_1, ylab="Energy Sub metering", xlab="",type="n")
lines(t, data$Sub_metering_1)
lines(t, data$Sub_metering_2, col="red")
lines(t, data$Sub_metering_3, col="blue")
legend("top", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), bty="n", xjust=1)

plot(t, data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",type="n")
lines(t, data$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off()