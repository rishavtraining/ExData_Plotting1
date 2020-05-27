
reader<-read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings="?")

req_dataset<-rbind(reader[reader$Date=="1/2/2007",],reader[reader$Date=="2/2/2007",])

req_dataset$Global_active_power<-as.numeric(req_dataset$Global_active_power)

req_dataset$datetime<-as.POSIXct(paste(req_dataset$Date,req_dataset$Time),format="%d/%m/%Y %H:%M:%S")

plot(x = req_dataset$datetime
     , y = req_dataset$Global_active_power 
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480)
dev.off()


