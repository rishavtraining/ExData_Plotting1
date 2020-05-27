
reader<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

req_dataset<-rbind(reader[reader$Date=="1/2/2007",],reader[reader$Date=="2/2/2007",])

req_dataset$Date<-as.Date(req_dataset$Date,format="%d%m%Y")

req_dataset$Global_active_power<-as.numeric(req_dataset$Global_active_power)

hist(req_dataset$Global_active_power,main="GLOBAL ACTIVE POWER",xlab="Global Active Power(Kilowatts)",col="red")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
