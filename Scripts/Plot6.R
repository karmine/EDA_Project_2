
###############################################################################
# Author: Sergio Contador
# Date: March 2017
# Title: Exploraty Data Analisys Course: Project 2
# Description:
## make a plot to answer next question: Compare emissions from motor vehicle
## sources in Baltimore City with emissions from motor vehicle sources in 
## Los Angeles County, California (fips == "06037"). Which city has seen 
## greater changes over time in motor vehicle emissions?
###############################################################################


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



