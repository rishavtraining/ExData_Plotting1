reader<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")

req_dataset<-rbind(reader[reader$Date=="1/2/2007",],reader[reader$Date=="2/2/2007",])

req_dataset$datetime<-as.POSIXct(paste(req_dataset$Date,req_dataset$Time),format="%d/%m/%Y %H:%M:%S")

req_dataset$Sub_metering_1<-as.numeric(req_dataset$Sub_metering_1)
req_dataset$Sub_metering_2<-as.numeric(req_dataset$Sub_metering_2)
req_dataset$Sub_metering_3<-as.numeric(req_dataset$Sub_metering_3)

plot(x=req_dataset$datetime,y=req_dataset$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering",lwd=1)
lines(x=req_dataset$datetime,y=req_dataset$Sub_metering_2,col="red")
lines(x=req_dataset$datetime,y=req_dataset$Sub_metering_3,col="Blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()