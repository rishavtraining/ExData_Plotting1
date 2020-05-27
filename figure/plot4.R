reader<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")

req_dataset<-rbind(reader[reader$Date=="1/2/2007",],reader[reader$Date=="2/2/2007",])

req_dataset$datetime<-as.POSIXct(paste(req_dataset$Date,req_dataset$Time),format="%d/%m/%Y %H:%M:%S")

req_dataset$Sub_metering_1<-as.numeric(req_dataset$Sub_metering_1)
req_dataset$Sub_metering_2<-as.numeric(req_dataset$Sub_metering_2)
req_dataset$Sub_metering_3<-as.numeric(req_dataset$Sub_metering_3)
req_dataset$Global_active_power<-as.numeric(req_dataset$Global_active_power)
req_dataset$Voltage<as.numeric(req_dataset$Voltage)
req_dataset$Global_reactive_power<-as.numeric(req_dataset$Global_reactive_power)

par(mfrow=c(2,2))

plot(x = req_dataset$datetime
     , y = req_dataset$Global_active_power 
     , type="l", xlab="", ylab="Global Active Power (kilowatts)",cex=0.2)

plot(x = req_dataset$datetime,y=req_dataset$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(x=req_dataset$datetime,y=req_dataset$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering",lwd=1)
lines(x=req_dataset$datetime,y=req_dataset$Sub_metering_2,col="red")
lines(x=req_dataset$datetime,y=req_dataset$Sub_metering_3,col="Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"),bty = "o")

plot(x = req_dataset$datetime,y = req_dataset$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
