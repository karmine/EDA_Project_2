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


# Plot 6
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


# Subset Data
NEI2 <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD", ]
NEI2 <- aggregate(Emissions ~ year + fips, NEI2, sum)
NEI2$fips[NEI2$fips == "24510"] <- "Baltimore, MD"
NEI2$fips[NEI2$fips == "06037"] <- "Los Angeles, CA"

# Plot 6
dir <- paste(dir.principal, "/Plots/Plot6.png", sep = "")
png(filename = dir, width = 480, height = 480)

g <- ggplot(NEI2, aes(factor(year), Emissions))
g + facet_grid(. ~ fips) + geom_bar(stat = "identity")  +
        xlab("year") + ylab(expression("Total PM"[2.5]* " Emissions")) +
        ggtitle("Total Emissions of Motor Vehicle Sources in Los Angeles vs. Baltimore")

dev.off()



