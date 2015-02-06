#===============================================================================
# author: Maykel L. Gonzalez-Martinez             date (last update): 06/02/2015                            
# status: finished, tested
#----------------------------- general information -----------------------------
# (If necessary, downloads &) unzips data file for Course Project 1 in
# "Exploratory Data Analysis" at Coursera.
#===============================================================================
file_setup <- function(url, fz_Name, f_Name){
  if (file.exists(fz_Name)){
    print("file_setup.R: Unzipping file...")
    unzip(zipfile = fz_Name, files = f_Name)
  }
  else{
    print("file_setup.R: Downloading & unzipping file...")
    download.file(url, destfile = fz_Name, method = "curl", mode = "wb")
    dateDownloaded <- date()
    unzip(zipfile = fz_Name, files = f_Name)
  }
}