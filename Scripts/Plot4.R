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


# Plot 4
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


# Coal combustion related sources
SCC2 = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]


# Merge two data sets
NEISCC <- merge(x = NEI, y = SCC2, by = "SCC")
NEISCC <- aggregate(NEISCC[, "Emissions"], by = list(NEISCC$year), sum)
colnames(NEISCC) <- c("Year", "Emissions")


# Plot4
dir <- paste(dir.principal, "/Plots/Plot4.png", sep = "")
png(filename = dir, width = 480, height = 480)

g <- ggplot(data = NEISCC, aes(x = Year, y = Emissions / 1000))  
g + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + 
        xlab("Year") + ylab(expression("Total PM"[2.5]* " in Kilotones")) + 
        ggtitle(expression("Total PM"[2.5]* " Emissions")) + 
        geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) + 
        theme(legend.position = "none") + scale_colour_gradient(low = "black", high = "green")

dev.off()



