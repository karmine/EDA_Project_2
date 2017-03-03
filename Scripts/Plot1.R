
###############################################################################
# Author: Sergio Contador
# Date: March 2017
# Title: Exploraty Data Analisys Course: Project 2
# Description: 
## make a plot to answer next question: Have total emissions from PM_{2.5}
## decreased in the United States from 1999 to 2008? 
###############################################################################


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

