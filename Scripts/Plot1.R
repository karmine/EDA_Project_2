# Exploratory Data Analysis - Project_2

#########################################################
# Author: Sergio Contador
# Date: March 2017
# Description: Exploraty Data Analisys Course: Project 2
# Steps:
## 0. Load datasets.
## 1. Merges the training and test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation
##    for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.
#########################################################


# Plot 1
# Load Data
dir.principal <- paste(getwd(), "/R/Programas/Data_Scientist/EDA/Project_2", sep = "")

# NEI Data
dir <- paste(dir.principal, "/Data/summarySCC_PM25.rds", sep = "")
NEI <- readRDS(dir)

# SCC Data
dir <- paste(dir.principal, "/Data/Source_Classification_Code.rds", sep = "")
SCC <- readRDS(dir)


# Viewing Data
names(NEI)
summary(NEI)
# View(NEI)

names(SCC)
summary(SCC)
# View(SCC)


# Aggregate
NEI2 <- aggregate(NEI[, "Emissions"], by = list(NEI$year), FUN = sum)
NEI2$PM <- round(NEI2[, 2] / 1000, 2)


# Plot1
dir <- paste(dir.principal, "/Plots/Plot1.png", sep = "")
png(filename = dir, width = 480, height = 480)

barplot(
        
        NEI2$PM, 
        names.arg = NEI2$Group.1, 
        xlab = "Year", 
        ylab = expression("Total PM"[2.5]* " in Kilotones"),
        main = expression("Total PM"[2.5]* " Emissions"),
        col = "snow2"
        
)

dev.off()

