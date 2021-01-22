## The common steps

## 1. download zip file from website
if(!file.exists("./data")) dir.create("./data")
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/EPC.zip")

## 2. unzip data
unzip("./data/EPC.zip", exdir = "./data")

## 3. load data into R
files <- file('./data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

## The specific steps of plot1

# 1. launch a png device
png(filename = './plot1.png', width = 480, height = 480, units='px')

# 2. plot figure
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))

# 3. close device
dev.off()