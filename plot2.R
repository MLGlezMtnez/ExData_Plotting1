#===============================================================================
# author: Maykel L. Gonzalez-Martinez             date (last update): 06/02/2015                            
# status: finished, tested
#----------------------------- general information -----------------------------
# Produces "plot2.png" for Course Project 1 in "Exploratory Data Analysis" at
# Coursera.
#===============================================================================
# (if necessary) downloads & unzips the data
f_Name <- "household_power_consumption.txt"
if(!file.exists(f_Name)) {
    if(file.exists("file_setup.R")) {
        source("file_setup.R")
        file_setup(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                   fz_Name = "exdata-data-household_power_consumption.zip",
                   f_Name)
        rm(file_setup) 
    } else {
        rm(f_Name)
        stop("'plot2.R': Fatal Error - Couldn't find data file (nor 'file_setup.R' to get it).")
    }
}

# loads the necessary data into a data table
library(data.table)
DT <- fread(input = f_Name, sep = ";", nrows = 2075259, header = TRUE,
            na.strings = c("?", "NA"))
DT_Feb <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007"]
rm(f_Name, DT)

# plots using the PNG plotting device, with the requested parameters
png(filename = "plot2.png", width = 480, height = 480, units = "px",
    bg = "transparent")
week_day <- strptime(paste(DT_Feb$Date, DT_Feb$Time, sep = " "),
                     format = "%d/%m/%Y %H:%M:%S")
plot(week_day, as.numeric(DT_Feb$Global_active_power), type = "l",
     main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

# turns graphics device OFF, removes defined objects & detaches loaded packages
dev.off()
rm(DT_Feb, week_day)
detach(name = "package:data.table", unload = TRUE)