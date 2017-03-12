createPlotOne <- function() {
  
  ## This function downloads the “Individual household electric power consumption 
  ## Data Set” file and generates the first plot required for the Coursera 
  ## 'Exploratory Data Analysis' Project 1.  

  ## Step 1 - DOWNLOADS AND UNZIPS DATA SET FILE
  ## In this step we check to see whether an '/assignmentdata' folder is in the
  ## current working directory, and creates one if there isn't.  The zip file is downloaded
  ## to the folder and is then unzipped.
  if(!file.exists("./assignmentdata")){dir.create("./assignmentdata")}
  fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileurl,destfile="./assignmentdata/dataset.zip",method="auto")
  unzip(zipfile="./assignmentdata/dataset.zip", exdir="./assignmentdata")
  files_location <- "./assignmentdata/"
  
  ## STEP 2 - READ DATA FILE AND CREATE SUBSET FOR 1 AND 2 FEB 2007
  householdconsumption <- read.table(paste(files_location, "household_power_consumption.txt", sep=""), sep=";", header=TRUE, na.strings="?", as.is=TRUE)
  consumptionfeb <- subset(householdconsumption, Date == "1/2/2007" | Date == "2/2/2007")
  consumptionfeb <- within(consumptionfeb, { timestamp=strptime(paste(Date, Time), "%d/%m/%Y%H:%M:%S") })
  
  ## STEP 3 - CREATE THE PLOT AND SAVE THE PLOT AS A PNG FILE IN THE WORKING DIRECTORY
  png("plot1.png", width = 480, height = 480)
  hist(consumptionfeb$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
  
}