
###############################################################################
# Author: Sergio Contador
# Date: March 2017
# Title: Exploraty Data Analisys Course: Project 2
# Description:
## make a plot to answer next question: Of the four types of sources 
## indicated by the type (point, nonpoint, onroad,
## nonroad) variable, which of these four sources have seen decreases in 
## emissions from 1999 to 2008 for Baltimore City? 
## Which have seen increases in emissions from 1999 to 2008?
###############################################################################


# Plot 3
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
NEI2 <- subset(NEI, fips == 24510)
NEI2$year <- factor(NEI2$year, levels = c("1999", "2002", "2005", "2008"))


# Plot3
dir <- paste(dir.principal, "/Plots/Plot3.png", sep = "")
png(filename = dir, width = 480, height = 480)

g <- ggplot(data = NEI2, aes(x = year, y = log(Emissions)))
g + facet_grid(. ~ type) + guides(fill = F) +
        geom_boxplot(aes(fill = type)) + stat_boxplot(geom = "errorbar") +
        xlab("Year") + ylab(expression(paste("Log", " of PM"[2.5], "Emissions"))) +  
        ggtitle("Emissions per Type in Baltimore City, Maryland") +
        geom_jitter(alpha = 0.10)

dev.off()


