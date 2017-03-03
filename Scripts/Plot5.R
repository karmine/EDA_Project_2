
###############################################################################
# Author: Sergio Contador
# Date: March 2017
# Title: Exploraty Data Analisys Course: Project 2
# Description:
## make a plot to answer next question: How have emissions from motor 
## vehicle sources changed from 1999 to 2008 in Baltimore City?
###############################################################################


# Plot 5
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
NEI2 <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
NEI2 <- aggregate(Emissions ~ year, NEI2, sum)


# Plot5
dir <- paste(dir.principal, "/Plots/Plot5.png", sep = "")
png(filename = dir, width = 480, height = 480)

g <- ggplot(NEI2, aes(factor(year), Emissions))
g + geom_bar(stat = "identity") +
        xlab("Year") + ylab(expression(paste("Log of PM"[2.5], " Emissions"))) + 
        ggtitle("Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland") 

dev.off()



