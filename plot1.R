#===============================================================================
# author: Maykel L. Gonzalez-Martinez             date (last update): 06/02/2015                            
# status: finished, tested
#----------------------------- general information -----------------------------
# Produces "plot1.png" for Course Project 1 in "Exploratory Data Analysis" at
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
        stop("'plot1.R': Fatal Error - Couldn't find data file (nor 'file_setup.R' to get it).")
    }
}

# loads the necessary data into a data table
library(data.table)
DT <- fread(input = f_Name, sep = ";", nrows = 2075259, header = TRUE,
            na.strings = c("?", "NA"))
DT_Feb <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007"]
rm(f_Name, DT)

# plots using the PNG plotting device, with the requested parameters
png(filename = "plot1.png", width = 480, height = 480, units = "px",
    bg = "transparent")
hist(as.numeric(DT_Feb$Global_active_power), col = "red", breaks = 12,
     main = "", xlab = "Global Active Power (kilowatts)")
title("Global Active Power")

# turns graphics device OFF, removes defined objects & detaches loaded packages
dev.off()
rm(DT_Feb)
detach(name = "package:data.table", unload = TRUE)