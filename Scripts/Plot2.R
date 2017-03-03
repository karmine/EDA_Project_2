
###############################################################################
# Author: Sergio Contador
# Date: March 2017
# Title: Exploraty Data Analisys Course: Project 2
# Description:
## make a plot to answer next question: Have total emissions from PM_{2.5} 
## decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? 
###############################################################################


# Plot 2
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
NEI2 <- subset(NEI, fips == "24510")


# Plot2
dir <- paste(dir.principal, "/Plots/Plot2.png", sep = "")
png(filename = dir, width = 480, height = 480)

barplot(
        
        tapply(X = NEI2$Emissions, INDEX = NEI2$year, FUN = sum), 
        xlab = "Year", 
        ylab = expression("PM"[2.5]),
        main = "Total Emission in Baltimore City, Meryland", 
        col = "snow2"
        
)

dev.off()

