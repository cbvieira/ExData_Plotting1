# Plot2

library("data.table")

getwd()
setwd("C:/Users/camil/OneDrive/Documentos/1. DOUTORADO/8. CURSOS LIVRES/COURSERA/EM ANDAMENTO/1. R/R_DATA SCIENCE/4. EXPLORATORY DATA ANALYSIS/SEMANA 1")
file.exists("household_power_consumption.txt")


###
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

##
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

##
powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

##
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## 
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()