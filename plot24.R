# Copyright (C) 2015 by Stephen Makonin.
# to be used with the data at EPA National Emissions Inventory web site

# load datasets
NEI <- readRDS("summarySCC_PM25.rds")
NEI$type <- factor(NEI$type)
NEI$year <- factor(NEI$year)

SCC <- readRDS("Source_Classification_Code.rds")
codes <- subset(SCC, grepl('coal', Short.Name, ignore.case=TRUE))$SCC

ds <- subset(NEI, NEI$SCC %in% codes)
ds <- aggregate(cbind(Emissions) ~ year, sum, data=ds)
ds$Emissions <- ds$Emissions / 1000

# create chart and save to png
png(file="plot24.png", bg="white")

barplot(ds$Emissions, main="Yearly Coal-Related PM2.5 Emissions", ylab="PM2.5 Emissions (in kilo-tons)", xlab="Year", col="red", names.arg=ds$year)

dev.off()



